//project logic
//configure the file tree


    $('#treeView').jstree({
     core : {
        "check_callback" :  function (op, node, par, pos, more) {
        // operation can be 'create_node', 'rename_node', 'delete_node', 'move_node', 'copy_node' or 'edit'
        // in case of 'rename_node' node_position is filled with the new node name
    if ((op === "move_node" || op === "copy_node") && node.type && node.type == "root") {
        alert('ajax call');
        return false;
    }

    if ((op === "move_node" || op === "copy_node") && more && more.core && !confirm('Are you sure ...')) {
        return false;
    }

    return true;
},
        data : {

                "url" : 'response.php?operation=get_node',
                'data' : function (node) {
                        return { "id" : node.id};
                        },
                "dataType" : "json" // needed only if you do not supply JSON headers
        },
    },

    types: {
    "root": {
      "icon" : "jstree-folder"
    },
    "child": {
      "icon" : "jstree-file"
    },
    "default" : {

    }
  },
    
            'plugins' : ['state','contextmenu','wholerow','dnd', 'types'],
            'contextmenu': {
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

       // console.log(data.node.icon);

        if (data.node.icon == "jstree-file" ) {
            $('.vakata-context').remove();
        }

      })

    //drag and drop  
        .bind('move_node.jstree', function(e, data) {            
            nodeid=data.node.id;
            pid=data.parent;
            
            //ajax call.....................................................
            $.ajax ({
                            url: "response.php?operation=dnd",
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
        //console.log(nodeid);

    //ajax call.....................................................
    $.ajax ({
                    url: "response.php?operation=getnode",
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
                    console.log(ID)
                    $("#bookparentid").val(ID);
                }

            }
        };

        return items;
    }
