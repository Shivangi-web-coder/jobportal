<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Models\Job;
use App\Models\JobType;
use App\Models\Category;
use Illuminate\Support\Facades\Validator;

class JobController extends Controller
{
    public function index(){
        $jobs=Job::orderBy('created_at','DESC')->with(['user','applications'])->paginate(10);
        return view('admin.jobs.list',['jobs'=>$jobs]);
    }

    public function edit($id){
        $jobs=Job::findOrFail($id);
        $categories=Category::orderBy('name','ASC')->get();
        $jobType=jobType::orderBy('name','ASC')->get();
        return view('admin.jobs.edit',['jobs'=>$jobs,'categories'=>$categories,'jobType'=>$jobType]);
    }

    public function update(Request $request, $id)
    {
        $rules = [
            'title' => 'required|min:5|max:200',
            'category' => 'required',
            'jobType' => 'required',
            'vacancy' => 'required|integer',
            'location' => 'required|max:50',
            'experiance' => 'required',
            'company_name' => 'required|min:3|max:75'
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->passes()) {
            $job = Job::find($id);
            $job->title = $request->title;
            $job->category_id = $request->category;
            $job->job_type_id = $request->jobType;
            $job->vacancy = $request->vacancy;
            $job->salary = $request->salary;
            $job->location = $request->location;
            $job->description = $request->description;
            $job->benefits = $request->benefits;
            $job->responsibility = $request->responsibility;
            $job->qualifications = $request->qualifications;
            $job->keywords = $request->keywords;
            $job->experiance = $request->experiance;
            $job->company_name = $request->company_name;
            $job->company_location = $request->company_location;
            $job->company_website = $request->company_website;
            $job->status = $request->status;
            $job->isFeatured = (!empty($request->isFeatured)) ? $request->isFeatured : 0;
            $job->save();
            session()->flash('success', 'Job updated successfully.');
            return response()->json([
                'status' => true,
                'errors' => []
            ]);
        } else {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }
    }

    public function destroy(Request $request){
        $id=$request->id;
        $job = Job::find($id);
        if($job==null){
            session()->flash('success', 'Either job deleted or not found.');
            return response()->json([
                'status' => false,
            ]);
        }
        $job->delete();
        session()->flash('success', 'Job deleted successfully.');
            return response()->json([
                'status' => true,
            ]);
    }
}
