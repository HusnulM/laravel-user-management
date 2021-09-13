@extends('templates/main')

@section('title', 'Add Menu Role')

@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
				<div class="panel-heading">
                    Add New User Role
                </div>
                <div class="panel-body">
                    <form action="{{ url('setting/userroles/save') }}" method="post">
                        @csrf
                        <div class="row">
                            <div class="col-lg-6">
                                <label for="email">User / Email *</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <input type="text" name="email" id="email" class="form-control" placeholder="Email" required readonly>
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-primary btn-sm" id="btn-select-user" style="height: 35px;margin-top: 0;">SELECT USER</button>
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
                                        <th style="width:80%;">Role Name</th>
                                        <th></th>
                                    </thead>
                                    <tbody class="mainbodynpo" id="tbl-role-body">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <button type="submit" class="btn btn-primary pull-right">
                                    <i class="fa fa-save"></i> SAVE
                                </button>
                                <button type="button" class="btn btn-success pull-right" id="btn-add-role">
                                    <i class="fa fa-plus"></i> ADD ROLE
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
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="modalSelectUser">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalSelectMenuTitle">User List</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card-body table-responsive">
                    <table class="table table-stripped" id="userList" style="width:100%;">
                        <thead>
                            <tr>
                                <th>Email</th>
                                <th>Name</th>
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
        var userrole_data        = [];

        function userroleExists(role, username) {
            return userrole_data.some(function(el) {                
                if(el.id === role && el.email === username){
                    return true;
                }else{
                    return false;
                }
            }); 
        }

        var count = 0;
        $('#btn-select-user').on('click', function(){
            loadUser();
            $('#modalSelectUser').modal('show');
        });

        $('#btn-add-role').on('click', function(){
            if($('#email').val() === ""){
                alert("Choose User")
            }else{
                loadRole();
                $('#modalSelectRole').modal('show');
            }
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
                // $('#rolename').val(selected_data.rolename);
                // $('#roleid').val(selected_data.id);
                // $('#modalSelectRole').modal('hide');
                if(userroleExists(selected_data.id, $('#email').val())){
                } else{
                        count = count+1;
                        html = '';
                        html = `
                            <tr counter="`+ count +`" id="tr`+ count +`">
                                <td class="nurut"> 
                                    `+ count +`
                                    
                                </td>
                                <td style="width:80%;"> 
                                    <input type="hidden" name="itm_roleid[]" value="`+ selected_data.id +`" />
                                    <input type="text" name="itm_idmenu[]" counter="`+count+`" class="form-control materialCode" style="width:100%;" required="true" value="`+ selected_data.rolename +`" readonly/>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-danger btn-sm removePO hideComponent" counter="`+count+`">Remove</button>
                                </td>
                            </tr>
                        `;
                        $('#tbl-role-body').append(html);
                        renumberRows();

                        var userroleData = {
                            id : selected_data.id,
                            email : $('#email').val()
                        }

                        userrole_data.push(userroleData);

                        $('.removePO').on('click', function(e){
                            e.preventDefault();
                            var row_index = $(this).closest("tr").index(); 
                            $(this).closest("tr").remove();
                            userrole_data.splice(row_index, 1);
                            renumberRows();
                        });
                }
            } );
        };

        function loadUser(){
            $('#userList').dataTable({
                "ajax": base_url+'/setting/users/list',
                "columns": [
                    { "data": "email" },
                    { "data": "name"},
                    {"defaultContent": "<button type='button' class='btn btn-primary btn-sm'><i class='fa fa-check'></i></button>"}
                ],
                "bDestroy": true,
                "paging":   true,
                "searching":   true
            });

            $('#userList tbody').on( 'click', 'button', function () {
                var table = $('#userList').DataTable();
                selected_data = [];
                selected_data = table.row($(this).closest('tr')).data();
                $('#email').val(selected_data.email);
                $('#modalSelectUser').modal('hide');
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