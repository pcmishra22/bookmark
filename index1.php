

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Bookmark Project</title>

    <!-- Bootstrap core CSS -->
    <link href="dist/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="dist/css/shop-item.css" rel="stylesheet">

    <!-- Temporary navbar container fix -->
    <style>
    .navbar-toggler {
        z-index: 1;
    }
    
    @media (max-width: 576px) {
        nav > .container {
            width: 100%;
        }
    }
    </style>

    <link rel="stylesheet" href="dist/themes/default/style.min.css" />

</head><body>
    <!-- Navigation -->
    <nav class="navbar fixed-top navbar-toggleable-md navbar-inverse bg-inverse">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarExample" aria-controls="navbarExample" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="container">
            <a class="navbar-brand" href="#">Start Bootstrap</a>
            <div class="collapse navbar-collapse" id="navbarExample">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Services</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

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
            <div class="col-lg-9" id='parentdatadiv'>
                
                <!-- /.card -->
                <div class="card card-outline-secondary my-4" id="datadiv">
                    <div class="card-header">
                        Create URL
                    </div>
                    <div class="card-block">
                    <form method="post" name="addform" action="">
                    <div class="form-group">
                        <label for="name">Title:</label>
                        <input type="text" class="form-control" name="title" id="title" required="required">

                    </div>
                    <hr>
                    <div class="form-group">
                        <label for="name">Url:</label>

                        <input type="text" class="form-control" name="url" id="url" required="required">
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
    <!-- Footer -->
    <footer class="py-5 bg-inverse">
        <div class="container">
            <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
        </div>
        <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="dist/jquery/jquery.min.js"></script>
    <script src="dist/tether/tether.min.js"></script>
    <script src="dist/bootstrap/js/bootstrap.min.js"></script>
    <script src="dist/jstree.min.js"></script>
    <script src="dist/application.js"></script>

</body>

</html>
