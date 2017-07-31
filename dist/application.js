//project logic
//configure the file tree

    $('#treeView').jstree
    ({
                "core" : {
                    "animation" : 0,
                    "check_callback" :  function (op, node, par, pos, more) {
                        if ((op === "move_node" || op === "copy_node") && node.type && node.type == "root") {
                            return false;
                        }
                        if((op === "move_node" || op === "copy_node") && more && more.core && !confirm('Are you sure ...')) {
                        return false;
                      }
                      return true;
                    },

                    "data"  : {

                                "url" : 'responsepdo.php?operation=get_node1',
                                'data' : function (node) {
                                        return { "id" : node.id};
                                        },
                                "dataType" : "json" // needed only if you do not supply JSON headers
                                },
                    },
                    
                "types" : {
                    "#" : {

                      "valid_children" : ["root"]
                    },
                    "root" : {
                      "icon" : "/static/3.1.1/assets/images/tree_icon.png",
                      "valid_children" : ["default"]
                    },
                    "default" : {
                      "valid_children" : ["default","file"]
                    },
                    "file" : {
                      "icon" : "glyphicon glyphicon-file",
                      "valid_children" : []
                    }
                  },
        
                "plugins" : ['state','contextmenu','dnd',"types"],
                "contextmenu": 
                {
                    'items': customMenu
                }
    })
    // listen for event
      .on('changed.jstree', function (e, data) {
        var id = data.selected[data.selected.length-1];
 
        $('#cat_id').val(id);
        $('#show_selected_id').html('ID: ' + id);
      })

    //show contextmenu of jstree.....................
    
      .on('show_contextmenu.jstree', function (e, data) {

        if (data.node.icon == "jstree-file" ) {
            $('.vakata-context').hide();
        }

      })
   
    //drag and drop  
        .bind('move_node.jstree', function(e, data) {            
            nodeid=data.node.id;
            pid=data.parent;

            //ajax call.....................................................
            $.ajax ({
                            url: "responsepdo.php?operation=dnd",
                            type: "post",
                            data: "id="+nodeid+'&pid='+pid,
                            success: function(res) {                                
                                $("#message").html(res);
                            }
                    });

    }) 
    //select node for update  
    .bind("select_node.jstree", function (e, data) {
        var nodeid=data.node.id;

    //ajax call.....................................................
    $.ajax ({
                    url: "responsepdo.php?operation=getnode",
                    type: "post",
                    data: "id="+nodeid,
                    success: function(res) {
                        $("#addbookmarkdatadiv").hide();
                        $("#addurldatadiv").hide();
                        
                        $("#parentdatadiv").html(res);
                    }
            });

    });

    function customMenu(node) {
        //debugger
        //Show a different label for renaming files and folders
        var tree = $('#treeView').jstree(true);

        var ID = $(node).attr('id');

        if (ID == "j1_1") {
            return items = {};
        }
        var $mynode = $('#' + ID);

        var createLabelUrl;
        var createLabelFolder;
        
        createLabelUrl=  "Add Folder";
        createLabelFolder=  "Add Bookmark";
        
        var items = {
            "addfolder": {
                "label": createLabelUrl, //Different label (defined above) will be shown depending on node type
                "action": function (obj) {
                    $("#ajaxdatadiv").hide();
                    $("#addbookmarkdatadiv").hide();
                    $("#addurldatadiv").show();
                    $("#parentid").val(ID);
                }
            },
            "addbookmark": {
                "label": createLabelFolder, //Different label (defined above) will be shown depending on node type
                "action": function (obj) { 
                    $("#ajaxdatadiv").hide();
                    $("#addurldatadiv").hide();
                    $("#addbookmarkdatadiv").show();
                    $("#bookparentid").val(ID);
                }

            }
        };

        return items;
    }
