@extends('templates/main')

@section('title', 'Add Menu Group')

@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
				<div class="panel-heading">
                    Add New Menu Group
                </div>
                <div class="panel-body">
                    <form action="{{ url('setting/menugroups/save') }}" method="post">
                        @csrf
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="groupname">Group Name *</label>
                                    <input type="text" name="groupname" class="form-control" placeholder="Group Name" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <button type="submit" class="btn btn-primary pull-right">
                                    <i class="fa fa-save"></i> SAVE
                                </button>
                                <a href="{{ url('setting/menugroups') }}" class="btn btn-danger pull-right">
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
        