@extends('templates/main')

@section('title', 'Add Role')

@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
				<div class="panel-heading">
                    Add New Role
                </div>
                <div class="panel-body">
                    <form action="{{ url('setting/roles/save') }}" method="post">
                        @csrf
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="rolename">Role Name *</label>
                                    <input type="text" name="rolename" class="form-control" placeholder="Role Name" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <button type="submit" class="btn btn-primary pull-right">
                                    <i class="fa fa-save"></i> SAVE
                                </button>
                                <a href="{{ url('setting/roles') }}" class="btn btn-danger pull-right">
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
        