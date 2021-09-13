@extends('templates/main')

@section('title', 'Data Menu')

@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
				<div class="panel-heading">
                    Data Menu
                    <a href="{{ url('setting/menus/create') }}" class="btn btn-primary pull-right">
                        <i class="fa fa-plus"></i> Add Menu
                    </a>
                </div>
                <div class="panel-body">
                    <div class="row">
                        @if ($message = Session::get('success'))
                        <div class="alert alert-success alert-block msgAlert">
                            <button type="button" class="close" data-dismiss="alert">×</button> 
                            <strong>{{ $message }}</strong>
                        </div>
                        @endif
                        @if(session()->has('error'))
                            <div class="alert alert-danger msgAlert">
                                {{ session()->get('error') }}
                            </div>
                        @endif
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <table class="table table-bordered table-striped table-hover table-sm">
                                <thead>
                                    <th>No.</th>
                                    <th>Menu</th>
                                    <th>Route</th>
                                    <th></th>
                                </thead>
                                <tbody>
                                    @foreach($data as $key => $d)
                                        <tr>
                                            <td>{{$key+1}}</td>
                                            <td>{{ $d->name }}</td>
                                            <td>{{ $d->route }}</td>
                                            <td style="text-align:center;">
                                                <a href="" class="btn btn-danger btn-sm">
                                                    <i class="fa fa-trash"></i> DELETE
                                                </a>
                                                <a href="" class="btn btn-success btn-sm">
                                                    <i class="fa fa-edit"></i> EDIT
                                                </a>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection