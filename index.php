<?php
require_once('responsepdo.php');
//insert row
if($_POST['submit']=='submit')
{
    if($_POST['type']=='isfolder')
    {
        $urlid=uniqidReal();
        $title=$_POST['title'];
        $parenturlid=$_POST['parentid'];
        $active='1';
        $created_ts=time();
        $created_dt=date("Y-m-d H:i:s");
        // prepare and bind
        $query = $pdo->prepare("INSERT INTO treeview(urlid, title,parenturlid,active,created_ts,created_dt) VALUES (?, ?, ?, ?, ?, ?)");

        //bind value with parameter
        $query->bindValue(1, $urlid);
        $query->bindValue(2, $title); 
        $query->bindValue(3, $parenturlid); 
        $query->bindValue(4, $active); 
        $query->bindValue(5, $created_ts); 
        $query->bindValue(6, $created_dt); 
        $query->execute();  

    }
    else
    {
        $urlid=uniqidReal();
        $title=$_POST['title'];
        $url=$_POST['url'];
        $parenturlid=$_POST['bookparentid'];
        $active='1';
        $created_ts=time();
        $created_dt=date("Y-m-d H:i:s");
        // prepare and bind
        $query = $pdo->prepare("INSERT INTO treeview(urlid, title, url,parenturlid,active,created_ts,created_dt) VALUES (?, ?, ?, ?, ?, ?, ?)");
        //bind value with parameter
        $query->bindValue(1, $urlid);
        $query->bindValue(2, $title); 
        $query->bindValue(3, $url); 
        $query->bindValue(4, $parenturlid); 
        $query->bindValue(5, $active); 
        $query->bindValue(6, $created_ts); 
        $query->bindValue(7, $created_dt); 
        $query->execute();  

    }
        if($query->rowCount()) {
            echo '<div align="center" class="alert alert-success"><strong>Record Saved successfully !</strong></div>';
         } else {
            echo '<div align="center" class="alert alert-danger"><strong>Record Not Saved. Please check the errors !</strong></div>';  
         }

}
//update row
if($_POST['submit']=='update')
{

     $urlid=$_POST['id'];
     $title=$_POST['title'];
     $url=$_POST['url'];
     $updated_ts=time();
     $updated_dt=date("Y-m-d H:i:s");
    // prepare and bind

    //$sql = "UPDATE treeview SET title = ? WHERE urlid = ?";
    # And pass optional (but important) PDO attributes

    $query = $pdo->prepare("UPDATE treeview SET title = ?, url = ?, updated_ts = ?, updated_dt = ? WHERE urlid = ?");     

    $query->bindValue(1, $title);
    $query->bindValue(2, $url); 
    $query->bindValue(3, $updated_ts); 
    $query->bindValue(4, $updated_dt); 
    $query->bindValue(5, $urlid); 
    $query->execute();  

 
     if($query->rowCount()) {
        echo '<div align="center" class="alert alert-success"><strong>Record Updated successfully !</strong></div>';
     } else {
        echo '<div align="center" class="alert alert-danger"><strong>Record Not Updated. Please check the errors !</strong></div>';  
     }

}
echo '<div id="message"></div>';
//header
require_once('header.php');
?>
<body>
<?php
require_once('navigation.php');
?>


    <!-- Page Content -->
    <div class="container">

        <div class="row">

            <div class="col-lg-3">
                <div class="list-group">
                    <a href="#" class="list-group-item active">Bookmark Tree </a>
                    
                    <div id="treeView" class="list-group-item"></div>
                </div>
            </div>
            <!-- /.col-lg-3 -->
            
            <div class="col-lg-9">    
            <div id='parentdatadiv'></div>
                <!-- /.card -->
                 <div class="card card-outline-secondary my-4" id="addurldatadiv" style="display:none;">
                    <div class="card-header">
                        Add Folder
                    </div>
                    <div class="card-block">
                    <form method="post" name="addform" action="">
                    <div class="form-group">
                        <label for="name">Title:</label>
                        <input type="text" class="form-control" name="title" id="title" required="required">
                        <input type="hidden" class="form-control" name="parentid" id="parentid">
                        <input type="hidden" class="form-control" name="type" value="isfolder">

                    </div>
                    <hr>
                    
                      <button type="submit" name="submit" value="submit" class="btn btn-success">Save</button>
                    </form>
                    </div>
                </div>
                <div class="card card-outline-secondary my-4" id="addbookmarkdatadiv" style="display:none;">
                    <div class="card-header">
                        Add Bookmark
                    </div>
                    <div class="card-block">
                    <form method="post" name="addbookmarkform" action="">
                    <div class="form-group">
                        <label for="name">Title:</label>
                        <input type="text" class="form-control" name="title" id="title" required="required">

                    </div>
                    <hr>
                    <div class="form-group">
                        <label for="name">Url:</label>

                        <input type="text" class="form-control" name="url" id="url" required="required">
                        <input type="hidden" class="form-control" name="bookparentid" id="bookparentid">
                        
                    </div>
                    <hr>
                      <button type="submit" name="submit" value="submit" class="btn btn-success">Save</button>
                    </form>
                    </div>
                </div>
                <!-- /.card -->

            </div>
            <!-- /.col-lg-9 -->

        </div>

    </div>
    <!-- /.container -->
<?php
require_once('footer.php');
?>

