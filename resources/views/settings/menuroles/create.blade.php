@extends('templates/main')

@section('title', 'Add Menu Role')

@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
				<div class="panel-heading">
                    Add New Menu Role
                </div>
                <div class="panel-body">
                    <form action="{{ url('setting/menuroles/save') }}" method="post">
                        @csrf
                        <div class="row">
                            <div class="col-lg-6">
                                <label for="rolename">Role Name *</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <input type="hidden" name="roleid" id="roleid">
                                        <input type="text" name="rolename" id="rolename" class="form-control" placeholder="Role Name" required readonly>
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-primary btn-sm" id="btn-select-role" style="height: 35px;margin-top: 0;">SELECT ROLE</button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <table class="table table-striped table-bordered" style="width:100%">
                                    <thead>
                                        <th style="width:50px;">No.</th>
                                        <th style="width:150px;">Menu ID</th>
                                        <th>Description</th>
                                        <th></th>
                                    </thead>
                                    <tbody id="tbl-menu-body">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <button type="submit" class="btn btn-primary pull-right">
                                    <i class="fa fa-save"></i> SAVE
                                </button>
                                <button type="button" class="btn btn-success pull-right" id="btn-add-menu">
                                    <i class="fa fa-plus"></i> ADD MENU
                                </button>
                                <a href="{{ url('setting/menuroles') }}" class="btn btn-danger pull-right">
                                    <i class="fa fa-arrow-left"></i> Cancel
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('modals')
<div class="modal fade bd-example-modal-md" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="modalSelectRole">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalSelectRoleTitle">ROLE</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card-body table-responsive">
                    <table class="table table-stripped" id="roleList" style="width:100%;">
                        <thead>
                            <tr>
                                <th>NO.</th>
                                <th>Role Name</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                        
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal"> Cancel</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal Select App Menu -->
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="modalSelectMenu">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalSelectMenuTitle">MENU</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card-body table-responsive">
                    <table class="table table-stripped" id="menuList" style="width:100%;">
                        <thead>
                            <tr>
                                <th>Menu ID</th>
                                <th>Description</th>
                                <th>Menu Group</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                        
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal"> Cancel</button>
            </div>
        </div>
    </div>
</div>
<!-- End Modal Select App Menu -->
@endsection

@section('additional-js')
<script>
    $(function(){
        var menurole_data        = [];

        function menuroleExists(roleid, menuid) {
            return menurole_data.some(function(el) {                
                if(el.roleid === roleid && el.menuid === menuid){
                    return true;
                }else{
                    return false;
                }
            }); 
        }

        var count = 0;
        $('#btn-select-role').on('click', function(){
            loadRole();
            $('#modalSelectRole').modal('show');
        });

        $('#btn-add-menu').on('click', function(){
            loadMenu();
            $('#modalSelectMenu').modal('show');
        });

        function loadRole(){
            $('#roleList').dataTable({
                "ajax": base_url+'/setting/roles/list',
                "columns": [
                    { "data": "id" },
                    { "data": "rolename" },
                    {"defaultContent": "<button type='button' class='btn btn-primary btn-sm'><i class='fa fa-check'></i></button>"}
                ],
                "bDestroy": true,
                "paging":   true,
                "searching":   true
            });

            $('#roleList tbody').on( 'click', 'button', function () {
                var table = $('#roleList').DataTable();
                selected_data = [];
                selected_data = table.row($(this).closest('tr')).data();
                $('#rolename').val(selected_data.rolename);
                $('#roleid').val(selected_data.id);
                $('#modalSelectRole').modal('hide');
            } );
        };

        function loadMenu(){
            $('#menuList').dataTable({
                "ajax": base_url+'/setting/menus/list',
                "columns": [
                    { "data": "id" },
                    { "data": "name" },
                    { "data": "groupname"},
                    {"defaultContent": "<button type='button' class='btn btn-primary btn-sm'><i class='fa fa-check'></i></button>"}
                ],
                "bDestroy": true,
                "paging":   true,
                "searching":   true
            });

            $('#menuList tbody').on( 'click', 'button', function () {
                var table = $('#menuList').DataTable();
                selected_data = [];
                selected_data = table.row($(this).closest('tr')).data();

                if(menuroleExists($('#inp-roleid').val(), selected_data.id)){
                } else{
                    count = count+1;
                    html = '';
                    html = `
                        <tr counter="`+ count +`" id="tr`+ count +`">
                            <td class="nurut"> 
                                `+ count +`
                                <input type="hidden" name="itm_no[]" value="`+ count +`" />
                            </td>
                            <td> 
                                <input type="text" name="itm_idmenu[]" counter="`+count+`" class="form-control materialCode" style="width:100%;" required="true" value="`+ selected_data.id +`" readonly/>
                            </td>
                            <td> 
                                <input type="text" name="itm_menu[]" counter="`+count+`" class="form-control" style="width:100%;" value="`+ selected_data.name +`" readonly/>
                            </td>
                            <td>
                                <button type="button" class="btn btn-danger btn-sm removePO hideComponent" counter="`+count+`">Remove</button>
                            </td>
                        </tr>
                    `;
                    $('#tbl-menu-body').append(html);
                    renumberRows();

                    var menuroleData = {
                        roleid : $('#inp-roleid').val(),
                        menuid : selected_data.id
                    }

                    menurole_data.push(menuroleData);

                    $('.removePO').on('click', function(e){
                        e.preventDefault();
                        var row_index = $(this).closest("tr").index(); 
                        $(this).closest("tr").remove();
                        menurole_data.splice(row_index, 1);
                        renumberRows();
                    });
                }
            } );
        }

        function renumberRows() {
            $(".mainbodynpo > tr").each(function(i, v) {
                $(this).find(".nurut").text(i + 1);
            });
        }
    });
</script>
@endsection