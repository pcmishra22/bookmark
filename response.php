
<?php
$servername = "localhost";
$username = "root";
//$password = "5d4a28813b3b7fc3d045c37ed07bba7c3eba02a30f0e4c70";
$password = "root1234";
$dbname = "bookmark";
//$conn = new PDO("mysql:host=$servername; dbname=$dbname", $username, $password);
$conn = mysqli_connect($servername, $username, $password, $dbname) or die("Connection failed: " . mysqli_connect_error());
/* check connection */
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}
if(isset($_GET['operation'])) {
	try {
		$result = null;
		switch($_GET['operation']) {
						case 'get_node1':

				//query for node
				$sql = "SELECT urlid,title,url,parenturlid FROM `treeview` ";
				//query result
				$res = mysqli_query($conn, $sql) or die("database error:". mysqli_error($conn));
				if($res->num_rows <=0){
				 //add condition when result is zero
				} else {
					//iterate on results row and create new index array of data
					while( $row = mysqli_fetch_assoc($res) ) { 
						$data[] = $row;
					}
					
					foreach ($data as $k=>$v )
					{

						if($data[$k] ['url']!='')
						{
							$data[$k] ['icon'] = 'jstree-file';
							$data[$k] ['type'] = 'file';
						}
						else
						{
							$data[$k] ['icon'] = 'jstree-folder';
						}

						if($data[$k] ['parenturlid']=='')
						{
							$data[$k] ['parent'] = '#';
						}	
						else
						{
							$data[$k] ['parent'] = $data[$k] ['parenturlid'];
						}

					  	$data[$k] ['id'] = $data[$k] ['urlid'];
					  	$data[$k] ['text'] = $data[$k] ['title'];
					  	
					}

				}
				$result = $data;
				break;
			case 'get_node':

				//query for node
				$sql = "SELECT urlid,title,url,parenturlid FROM `treeview` ";
				//query result
				$res = mysqli_query($conn, $sql) or die("database error:". mysqli_error($conn));
				if($res->num_rows <=0){
				 //add condition when result is zero
				} else {
					//iterate on results row and create new index array of data
					while( $row = mysqli_fetch_assoc($res) ) { 
						$data[] = $row;
					}
					
					foreach ($data as $k=>$v )
					{

						if($data[$k] ['url']!='')
						{
							$data[$k] ['icon'] = 'jstree-file';
							$data[$k] ['type'] = 'bookmark';
						}
						else
						{
							$data[$k] ['icon'] = 'jstree-folder';
							$data[$k] ['type'] = 'folder';
						}

						if($data[$k] ['parenturlid']=='')
						{
							$data[$k] ['parent_id'] = '#';
						}	
						else
						{
							$data[$k] ['parent_id'] = $data[$k] ['parenturlid'];
						}

					  	$data[$k] ['id'] = $data[$k] ['urlid'];
					  	$data[$k] ['text'] = $data[$k] ['title'];
					  	
					}


					$itemsByReference = array();

				// Build array of item references:
				foreach($data as $key => &$item) {
				   $itemsByReference[$item['urlid']] = &$item;
				   // Children array:
				   $itemsByReference[$item['urlid']]['children'] = array();
				   // Empty data class (so that json_encode adds "data: {}" ) 
				   $itemsByReference[$item['urlid']]['data'] = new StdClass();
				}

				// Set items as children of the relevant parent item.
				foreach($data as $key => &$item)
				{

				   if($item['parent_id'] && isset($itemsByReference[$item['parent_id']]))
				   {
					  $itemsByReference [$item['parent_id']]['children'][] = &$item;
				   }
				}	

				// Remove items that were added to parents elsewhere:
				foreach($data as $key => &$item) {
				   if($item['parent_id'] && isset($itemsByReference[$item['parent_id']]))
					  unset($data[$key]);
				}
				}
				$result = $data;
				break;
			case 'get_node_by_id':
				$node = isset($_GET['urlid']) && $_GET['urlid'] !== '#' ? $_GET['urlid'] : 0;
				//check for id
				if($node!=0)
					$sql=	"SELECT * FROM `treeview` where urlid='$node'";
				else
					break;	
				//query result
				$res = mysqli_query($conn, $sql) or die("database error:". mysqli_error($conn));
				if($res->num_rows <=0){
				 //add condition when result is zero
				} else {
					//iterate on results row and create new index array of data
					while( $row = mysqli_fetch_assoc($res) ) { 
						$data[] = $row;
					}
					foreach ($data as $k=>$v )
					{
					  $data[$k] ['id'] = $data[$k] ['urlid'];
					  $data[$k] ['text'] = $data[$k] ['url'];
					  $data[$k] ['parent_id'] = $data[$k] ['parenturlid'];
					}


					$itemsByReference = array();

				// Build array of item references:
				foreach($data as $key => &$item) {
				   $itemsByReference[$item['urlid']] = &$item;
				   // Children array:
				   $itemsByReference[$item['urlid']]['children'] = array();
				   // Empty data class (so that json_encode adds "data: {}" ) 
				   $itemsByReference[$item['urlid']]['data'] = new StdClass();
				}

				// Set items as children of the relevant parent item.
				foreach($data as $key => &$item)
				{

				   if($item['parent_id'] && isset($itemsByReference[$item['parent_id']]))
				   {
					  $itemsByReference [$item['parent_id']]['children'][] = &$item;
				   }
				}	

				// Remove items that were added to parents elsewhere:
				foreach($data as $key => &$item) {
				   if($item['parent_id'] && isset($itemsByReference[$item['parent_id']]))
					  unset($data[$key]);
				}
				}
				$result = $data;
				break;
					
			
			case 'getnode':
					$urlid=$_POST['id'];
					$sql = "SELECT * FROM `treeview` where urlid='".$urlid."'";
					$res = mysqli_query($conn, $sql) or die("database error:". mysqli_error($conn));
					while( $row = mysqli_fetch_assoc($res) ) { 
						 $urlid=$row['urlid'];
						 $title=$row['title'];
						 $url=$row['url'];
						}
						if($url=='')
						 {
					?>
						<div class="card card-outline-secondary my-4" id="ajaxdatadiv">
	                    <div class="card-header">
	                        Update Folder
	                    </div>
	                    <div class="card-block">
	                    <form method="post" name="getform" action="">
	                    <div class="form-group">
	                        <label for="name">Title:</label>
	                        <input type="text" class="form-control" name="title" id="title" value="<?php echo $title?>"required="required">
	                           <input type="hidden" class="form-control" name="id" id="id" value="<?php echo $urlid?>">
						</div>
	                    <hr>
	                      <button type="submit" name="submit" value="update" class="btn btn-success">Update</button>
	                    </form>
	                    </div>
	                	</div>
					<?php
						}
						 else
						 {
					?>
								<!-- /.card -->
								<div class="card card-outline-secondary my-4" id="ajaxdatadiv">
				                    <div class="card-header">
				                        Update Bookmark
				                    </div>
				                    <div class="card-block">
				                    <form method="post" name="getform" action="">
				                    <div class="form-group">
				                        <label for="name">Title:</label>
				                        <input type="text" class="form-control" name="title" id="title" value="<?php echo $title?>"required="required">

				                    </div>
				                    <hr>
				                    <div class="form-group">
				                        <label for="name">Url:</label>

				                        <input type="text" class="form-control" name="url" id="url" value="<?php echo $url?>"required="required">
				                        <input type="hidden" class="form-control" name="id" id="id" value="<?php echo $urlid?>">
				                    </div>
				                    <hr>
				                      <button type="submit" name="submit" value="update" class="btn btn-success">Update</button>
				                    </form>
				                    </div>
				                </div>
                				<!-- /.card -->
					<?php

						 }	
				?>
	
				<?php
			
				die;
				break;
				
			case 'dnd':
				$urlid=$_POST['id'];
				$parenturlid=$_POST['pid'];

				//check that parent node is not bookmark
				$sql="Select url from treeview where urlid='$parenturlid'";

				$res =mysqli_query($conn, $sql);

				$sql = "UPDATE `treeview`  SET `parenturlid` = '$parenturlid' WHERE `urlid` = '$urlid'";
				
				if(mysqli_query($conn, $sql))
        			echo '<div align="center" class="alert alert-success"><strong>Record Updated successfully !</strong></div>';
    			else
        			echo '<div align="center" class="alert alert-danger"><strong>Record Not Updated. Please check the errors !</strong></div>'; 

        		die;
				break;
					
			case 'create_node':
				$node = isset($_GET['id']) && $_GET['id'] !== '#' ? (int)$_GET['id'] : 0;
				
				$nodeText = isset($_GET['text']) && $_GET['text'] !== '' ? $_GET['text'] : '';
				$sql ="INSERT INTO `treeview_items` (`name`, `text`, `parent_id`) VALUES('".$nodeText."', '".$nodeText."', '".$node."')";
				mysqli_query($conn, $sql);
				
				$result = array('id' => mysqli_insert_id($conn));
				print_r($result);die;
				break;
			case 'rename_node':
				$node = isset($_GET['id']) && $_GET['id'] !== '#' ? (int)$_GET['id'] : 0;
				//print_R($_GET);
				$nodeText = isset($_GET['text']) && $_GET['text'] !== '' ? $_GET['text'] : '';
				$sql ="UPDATE `treeview_items` SET `name`='".$nodeText."',`text`='".$nodeText."' WHERE `id`= '".$node."'";
				mysqli_query($conn, $sql);
				break;
			case 'delete_node':
				$node = isset($_GET['id']) && $_GET['id'] !== '#' ? (int)$_GET['id'] : 0;
				$sql ="DELETE FROM `treeview_items` WHERE `id`= '".$node."'";
				mysqli_query($conn, $sql);
				break;
			default:
				throw new Exception('Unsupported operation: ' . $_GET['operation']);
				break;
		}
		header('Content-Type: application/json; charset=utf-8');
		echo json_encode($result);
	}
	catch (Exception $e) {
		header($_SERVER["SERVER_PROTOCOL"] . ' 500 Server Error');
		header('Status:  500 Server Error');
		echo $e->getMessage();
	}
	die();
}
//function to return 16 character uniq id 
function uniqidReal($lenght = 16) {
    // uniqid gives 13 chars, but you could adjust it to your needs.
    if (function_exists("random_bytes")) {
        $bytes = random_bytes(ceil($lenght / 2));
    } elseif (function_exists("openssl_random_pseudo_bytes")) {
        $bytes = openssl_random_pseudo_bytes(ceil($lenght / 2));
    } else {
        throw new Exception("no cryptographically secure random function available");
    }
    return substr(bin2hex($bytes), 0, $lenght);
}

?>
