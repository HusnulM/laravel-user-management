@extends('templates/main')

@section('title', 'Add User')

@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
				<div class="panel-heading">
                    Add New User
                    <a href="{{ url('setting/users') }}" class="btn btn-danger pull-right">
                        <i class="fa fa-arrow-left"></i> Cancel
                    </a>
                </div>
                <div class="panel-body">
                    <form action="{{ url('setting/users/save') }}" method="post">
                        @csrf
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="name">Name *</label>
                                    <input type="text" name="name" class="form-control" placeholder="Name" required>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="email">Email *</label>
                                    <input type="email" name="email" class="form-control" placeholder="Email" required>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="password">Password *</label>
                                    <input type="password" name="password" class="form-control" placeholder="Password" autocomplete="new-password" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                            <button type="submit" class="btn btn-primary pull-right">
                                <i class="fa fa-save"></i> SAVE
                            </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
        