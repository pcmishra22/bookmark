//project logic
//configure the file tree
$(document).bind("dnd_start.vakata", function(e, data) {
    console.log("Start dnd");
})
.bind("dnd_move.vakata", function(e, data) {
    console.log("Move dnd");
})
.bind("dnd_stop.vakata", function(e, data) {
    console.log("Stop dnd");
});
    $('#treeView').jstree({
     core : {
        "check_callback" :  function (op, node, par, pos, more) {
        // operation can be 'create_node', 'rename_node', 'delete_node', 'move_node', 'copy_node' or 'edit'
        // in case of 'rename_node' node_position is filled with the new node name
    if ((op === "move_node" || op === "copy_node") && node.type && node.type == "root") {
        alert('ajax call');
        return false;
    }
    if(op==="rename_node")
    {
        alert('ajax call');
        return true;
    }
    if ((op === "move_node" || op === "copy_node") && more && more.core && !confirm('Are you sure ...')) {
        alert('ajax call');
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

    
    dnd:{
      'drop_finish' : function (data) { 
                alert("DROP"); 
            },
      'drag_check' : function (data) {
                if(data.r.attr("id") == "phtml_1") {
                    return false;
                }
                return { 
                    after : false, 
                    before : false, 
                    inside : true 
                };

                alert("hhh jjj kk ");
            },
        'drag_finish' : function (data) { 
                alert("DRAG OK"); 
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
      .on('dnd_stop.vakata', function (e, data) {
            alert('dnd stop now..........');
        })
      .on('rename_node.jstree', function (e, data) {
        //console.log(data.node.id);
        //console.log(is_numeric(data.node.id));
        if(is_numeric(data.node.id) == false) return;
 
        var parent = data.node.parent;
        if(parent == '#') {
            parent = 0;
        }
        
        update_item('update', parent, data.node.id, data.text);
      })
    .on('hover_node.jstree', function (e, data) {
        var $node = $("#" + data.node.id);
        var url = $node.find('a').attr('href');

        if (url != '#') {
            //get the mouse position
            var x = $node.position().left + 150;
            var y = $node.position().top;
            $('.tooltip').css({
                'top': y + 'px',
                    'left': x + 'px'
            });
            $('.tooltip').find('img').attr('src', url);
            $('.tooltip').fadeIn(300, 'easeOutSine');
        }
    })
    .on('dehover_node.jstree', function () {
        $('.tooltip').hide();
    })
    .on('create_node.jstree', function (e, data) {
        update_item('new', data.node.parent, 0, data.node.text);
      })
    .on('delete_node.jstree', function (e, data) {
        var $node = $('#' + data.node.id);
        alert($node.text());

    }).bind("move_node.jstree", function(e, data) {
        console.log("Drop node " + data.node.id + " to " + data.parent);
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
        var renameLabel;
        var deleteLabel;
        
        var folder = false;
        if ($mynode.hasClass("jstree-closed") || $mynode.hasClass("jstree-open")) { //If node is a folder
            
            createLabelUrl=  "Create Url";
            createLabelFolder=  "Create Folder";
            renameLabel = "Rename Folder";
            deleteLabel = "Delete Folder";

            folder = true;
        } else {
            createLabelUrl=  "Create Url";
            createLabelFolder=  "Create Folder";
            renameLabel = "Rename File";
            deleteLabel = "Delete File";
        }
        var items = {
            "createurl": {
                "label": createLabelUrl, //Different label (defined above) will be shown depending on node type
                "action": function (obj) {
                    $("#parentid").val(ID);
                    $("#datadiv").show();
                }
            },
            "createfolder": {
                "label": createLabelFolder, //Different label (defined above) will be shown depending on node type
                "action": function (obj) { 
                    var $node = tree.create_node(node);
                    tree.edit($node);
                }

            },
            "Rename": {
                "separator_before": false,
                "separator_after": false,
                "label": "Rename",
                "action": function (obj) { 
                    tree.edit(node);
                }
            },

            "Edit": {
                "separator_before": false,
                "separator_after": false,
                "label": "Edit",
                "action": function (obj) { 
                    tree.edit(node);
                }
            },

            "Edit1": {
                "separator_before": false,
                "separator_after": false,
                "label": "Edit1",
                "action": false,
                "submenu" :{
                    "create_file" : {
                        "seperator_before" : false,
                        "seperator_after" : false,
                        "label" : "File",
                        action : function (obj) {
                            tree.create(obj, "last", {"attr" : {"rel" : "default"}});
                        }
                    },
                    "create_folder" : {
                        "seperator_before" : false,
                        "seperator_after" : false,
                        "label" : "Folder",
                        action : function (obj) {                               
                            tree.create(obj, "last", {"attr" : { "rel" : "folder"}});
                        }
                    }
                }
            },                         
            "Remove": {
                "separator_before": true,
                "separator_after": false,
                "label": "Remove",
                "action": function (obj) { 
                    if(confirm('Are you sure to remove this category?')){
                        tree.delete_node(node);
                    }
                }
            }
        };

        return items;
    }
