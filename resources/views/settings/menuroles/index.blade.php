@extends('templates/main')

@section('title', 'Data Menu Role')

@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
				<div class="panel-heading">
                    Menu Role
                    <a href="{{ url('setting/menuroles/create') }}" class="btn btn-primary pull-right">
                        <i class="fa fa-plus"></i> Add Menu Role
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
                            <table id="table-data" class="table table-bordered table-striped table-hover table-sm">
                                <thead>
                                    <th>No.</th>
                                    <th>Menu</th>
                                    <th>Role</th>
                                    <th></th>
                                </thead>
                                <tbody>
                                    @foreach($data as $key => $d)
                                        <tr>
                                            <td>{{$key+1}}</td>
                                            <td>{{ $d->description }}</td>
                                            <td>{{ $d->role }}</td>
                                            <td></td>
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

@section('additional-js')
<script>
    $(function(){
        $('#table-data').DataTable();
    });
</script>
@endsection