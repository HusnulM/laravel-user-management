@extends('templates/main')

@section('title', 'Add Menu')

@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
				<div class="panel-heading">
                    Add New Menu
                </div>
                <div class="panel-body">
                    <form action="{{ url('setting/menus/save') }}" method="post">
                        @csrf
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="menuname">Menu Name *</label>
                                    <input type="text" name="menuname" class="form-control" placeholder="Menu Name" required>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="menuroute">Menu Route *</label>
                                    <input type="text" name="menuroute" class="form-control" placeholder="Route" required>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="menugroups">Menu Groups *</label>
                                    <select name="menugroups" class="form-control" required>
                                        @foreach($groups as $key => $d)
                                            <option value="{{ $d->id }}">{{ $d->description }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <button type="submit" class="btn btn-primary pull-right">
                                    <i class="fa fa-save"></i> SAVE
                                </button>
                                <a href="{{ url('setting/menus') }}" class="btn btn-danger pull-right">
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
        