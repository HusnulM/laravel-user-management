@extends('templates/main')

@section('title', $page)

@section('content')
    <div class="panel panel-container">
        <div class="row">
            <div class="col-xs-12 col-md-12 col-lg-12 no-padding">
                <div class="panel panel-teal panel-widget border-right">
                    <h1>{{ $page }}</h1>
                </div>
            </div>
        </div>
    </div>
@endsection