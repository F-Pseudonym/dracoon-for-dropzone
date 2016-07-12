# Dropzone Action Info
# Name: Share with Secure Data Space
# Description: Upload a file to SSP Secure Data Space and create a share link (URL will be placed clipboard). Holding 'Command' (⌘) will expire the uploaded file and its share link after 14 days. Clicking on this Action copies the latest share link to the clipboard.\nIcon is owned by SSP Europe GmbH.
# Handles: Files
# Creator: Florian Scheuer
# URL: https://github.com/F-Pseudonym/dropzone-share-with-sds
# Events: Dragged, Clicked
# KeyModifiers: Command
# SkipConfig: No
# RunsSandboxed: Yes
# OptionsNIB: ExtendedLogin
# Version: 1.3
# MinDropzoneVersion: 3.0


require 'Date'
require 'secure_data_space'

def dragged
  
  validity = 14 #days


  sds = SecureDataSpace.new ENV["server"]  

      
  $dz.begin("Starting Share Operation...")
  $dz.determinate(true)
  
  
  # User log-on
  auth_token = sds.login ENV["username"], ENV["password"]
  

  if auth_token == "" or auth_token == nil
    $dz.fail("Login error. No token provided.")
  end
  
  
  $dz.percent(5)
    
    
  # Determine Container ID for storage location
  path = ENV["remote_path"].split('/')
  container_id = 0
  path.each do |name|
    # Get Data Rooms to retrieve room_id
    nodes = sds.get_nodes_by_name name, container_id, depth_level = 0

    # Fetch room_id
    if nodes["range"]["total"] > 0
      
      containers = nodes["items"]
      containers.each do |container|
        if container["name"] == name
          container_id = container["id"]
        end
      end
      
    else    
      # Create Room/Folder
      if container_id == 0
        node = sds.create_room name
      else
        node = sds.create_folder name, container_id
      end
      container_id = node["id"]
    end
  end  
  
  if container_id == nil
    $dz.fail("Room error!")
  end
  
  
  # Addtional folder if more than 1 file
  if $items.count > 1
    name = DateTime.now.strftime('%FT%H-%M-%S.%L')
    node = sds.create_folder name, container_id
    container_id = node["id"]
    container_name = node["name"]
  end
  

  $dz.percent(10)


  # calculate expiry date
  if ENV['KEY_MODIFIERS'] == 'Command'
    expiryDate = DateTime.now + validity
  else
    expiryDate = nil
  end

  # Upload file(s)
  files = $items
  file_id = 0
  file_name = nil
  i = 0
  
  files.each do |file|
    i = i + 1
    file_name = file.rpartition('/').last
    
    # Upload File
    file_info = sds.upload_file File.new(file), container_id, expire_at = expiryDate
  
    if file_info == nil
      $dz.fail("Upload failed.")
    end
  
    file_id = file_info["id"]
    $dz.percent((i * ((90 - 10) / $items.count )) + 10)
  
  end

  
  access_key = nil
  
  # Determine ID to share and name
  if $items.count > 1
    id = container_id
    share_name = container_name
  else
    id = file_id
    share_name = file_name
  end
  
  # Create share link
  share = sds.create_download_share id, share_name, nil, false, expire_at = expiryDate
  access_key = share["accessKey"]
  
  if access_key == nil
    $dz.fail("Error sharing file: No Access Key was provided")
  end
  
  
  share_link = share["link"]
  $dz.percent(95)
  $dz.save_value('last_share_link', share_link)

  
  # User logout
  sds.logout
  
  # Finish
  $dz.finish("Success!")
  $dz.text(share_link)

end



 
def clicked

  share_link = ENV['last_share_link']
  
  if share_link == nil
    $dz.fail("No Share Link available.")
  else
    $dz.finish("Last Share Link copied to clipboard.")
    $dz.text(share_link)
  end
end
