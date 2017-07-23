$('#tree').jstree({
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

                                "url" : 'response.php?operation=get_node1',
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
                "plugins" : ['contextmenu','wholerow','dnd','types'],
                "contextmenu": 
                {
                    'items': customMenu
                }  
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