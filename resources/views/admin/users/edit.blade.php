@extends('front.layouts.app')
@section('main')
<section class="section-5 bg-2">
    <div class="container py-5">
        <div class="row">
            <div class="col">
                <nav aria-label="breadcrumb" class=" rounded-3 p-3 mb-4">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="{{ route("admin.dashboard") }}">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{ route("admin.users") }}">Users</a></li>
                        <li class="breadcrumb-item active">Edit</li>
                    </ol>
                </nav>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3">
                @include('admin.sidebar')
            </div>
            <div class="col-lg-9">
                @include('front.message')
                     <div class="card border-0 shadow mb-4 p-3">
                    <div class="card-body card-form">
                       <form action=""  id="userForm">
                    <div class="card-body  p-4">
                        <h3 class="fs-4 mb-1">User Edit</h3>
                        <div class="mb-4">
                            <label for="" class="mb-2">Name*</label>
                            <input type="text" name="name" id="name" placeholder="Enter Name" class="form-control" value="{{ $user->name }}">
                            <p></p>
                        </div>
                        <div class="mb-4">
                            <label for="" class="mb-2">Email*</label>
                            <input type="text" placeholder="Enter Email" name="email" id="email" class="form-control" value="{{ $user->email }}">
                            <p></p>
                        </div>
                        <div class="mb-4">
                            <label for="" class="mb-2">Designation*</label>
                            <input type="text" placeholder="Designation" name="designation" id="designation" class="form-control" value="{{ $user->designation }}">
                            <p></p>
                        </div>
                        <div class="mb-4">
                            <label for="" class="mb-2">Mobile*</label>
                            <input type="text" placeholder="Mobile" name="mobile" id="mobile" class="form-control" value="{{ $user->mobile }}">
                            <p></p>
                        </div>                        
                    </div>
                    <div class="card-footer  p-4">
                        <button type="submit" class="btn btn-primary">Update</button>
                    </div>
                    </form>
                    </div>
                </div> 
            </div>
        </div>
    </div>
</section>
@endsection
@section('customJs')
<script type="text/javascript">
    $('#userForm').submit(function(e){
        e.preventDefault();
        $.ajax({
            url:'{{ route("admin.users.update",$user->id) }}',
            type:'put',
            dataType:'json',
            data:$('#userForm').serializeArray(),
            success:function(response){
                if(response.status==true){
                    $('#name').removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html('');
                    $('#email').removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html('');
                    window.location.href="{{ route('admin.users') }}";
                }else{
                var errors=response.errors;
                    if(errors.name){
                        $('#name').addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(errors.name);
                    }else{
                        $('#name').removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html('');
                    }
                    if(errors.email){
                        $('#email').addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(errors.email);
                    }else{
                        $('#email').removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html('');
                    }
                }
            }
        });
    });
</script>
@endsection