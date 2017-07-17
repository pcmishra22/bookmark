<?php
require_once('response.php');
//insert row
if($_POST['submit']=='submit')
{
    $urlid=uniqidReal();
    $title=$_POST['name'];
    $url=$_POST['name'];
    $parenturlid=$_POST['parentid'];
    $active='1';
    $created_ts=time();
    $created_dt=date("Y-m-d H:i:s");
    // prepare and bind
    $stmt = $conn->prepare("INSERT INTO treeview(urlid, title, url,parenturlid,active,created_ts,created_dt) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("sssssss", $urlid, $title, $url, $parenturlid, $active, $created_ts, $created_dt);
    if($stmt->execute())
        echo '<div align="center" class="alert alert-success"><strong>Record Saved successfully !</strong></div>'; 
    $stmt->close();
}
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
                
                <!-- /.card -->
                <div class="card card-outline-secondary my-4" id="datadiv" style="display:none;">
                    <div class="card-header">
                        Create URL
                    </div>
                    <div class="card-block">
                    <form method="post" name="addform" action="">
                    <div class="form-group">
                        <label for="name">URL Name:</label>
                        <input type="text" class="form-control" name="name" id="name">
                        <input type="hidden" class="form-control" name="parentid" id="parentid">
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

