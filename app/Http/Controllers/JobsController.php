<?php

namespace App\Http\Controllers;

use App\Mail\JobNotificationEmail;
use App\Models\Category;
use App\Models\JobType;
use App\Models\Job;
use App\Models\User;
use App\Models\SavedJob;
use App\Models\JobApplication;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

class JobsController extends Controller
{
    public function index(Request $request)
    {
        $categories = Category::orderBy('name', 'Asc')->where('status', 1)->get();
        $jobTypes = JobType::orderBy('name', 'Asc')->where('status', 1)->get();

        $jobs = Job::where('status', 1);

        //search using keyword
        if (!empty($request->keyword)) {
            $jobs = $jobs->where(function ($query) use ($request) {
                $query->orWhere('title', 'like', '%' . $request->keyword . '%');
                $query->orWhere('keywords', 'like', '%' . $request->keyword . '%');
            });
        }

        //search using location
        if (!empty($request->location)) {
            $jobs = $jobs->where('location', $request->location);
        }

        //search using category
        if (!empty($request->category)) {
            $jobs = $jobs->where('category_id', $request->category);
        }

        //search using jobType
        $jobTypeArray = [];
        if (!empty($request->jobType)) {
            $jobTypeArray = explode(',', $request->jobType);
            $jobs = $jobs->whereIn('job_type_id', $jobTypeArray);
        }

        //search using experiance
        if (!empty($request->experiance)) {
            $jobs = $jobs->where('experiance', $request->experiance);
        }

        $jobs = $jobs->with(['jobType', 'category']);
        if ($request->sort == '0') {
            $jobs = $jobs->orderBy('created_at', 'ASC');
        } else {
            $jobs = $jobs->orderBy('created_at', 'DESC');
        }
        $jobs = $jobs->paginate(6);
        return view('front.jobs', ['categories' => $categories, 'jobTypes' => $jobTypes, 'jobs' => $jobs, 'jobTypeArray' => $jobTypeArray]);
    }

    public function jobDetail($id)
    {
        $count=0;
        if(Auth::user()){
        $count=Savedjob::where(['job_id'=>$id,'user_id'=>Auth::user()->id])->count();
        }

        $job = Job::where(['id' => $id, 'status' => 1])->with(['jobType', 'category'])->first();
        if ($job == null) {
            abort(404);
        }
        $applications= JobApplication::where('job_id',$id)->with('user')->get();
        return view('front.jobDetail', ['job' => $job,'count'=>$count,'applications'=>$applications]);
    }

    public function applyJob(Request $request)
    {
        $id = $request->id;
        $JobApplicationCount = JobApplication::where(['job_id' => $id, 'user_id' => Auth::user()->id])->count();
        if ($JobApplicationCount > 0) {
            $message = 'You already applied on this job.';
            session()->flash('error', $message);
            return response()->json([
                'status' => false,
                'errors' => $message
            ]);
        }

        $job = Job::where('id', $id)->first();
        if ($job == null) {
            $message = 'Job does not exist.';
            session()->flash('error', $message);
            return response()->json([
                'status' => false,
                'errors' => $message
            ]);
        }

        $employer_id = $job->user_id;
        if ($employer_id == Auth::user()->id) {
            $message = 'You can not apply on your own job.';
            session()->flash('error', $message);
            return response()->json([
                'status' => false,
                'errors' => $message
            ]);
        }

        $application = new JobApplication();
        $application->job_id = $id;
        $application->user_id = Auth::user()->id;
        $application->employer_id = $employer_id;
        $application->applied_date = now();
        $application->save();

        //send mail to employer
        $employer=User::where('id',$employer_id)->first();
        $mailData=[
            'employer'=>$employer,
            'user'=>Auth::user(),
            'job'=>$job
        ];
        Mail::to($employer->email)->send(new JobNotificationEmail($mailData));
        $message = 'You have applied job successfully.';
        session()->flash('success', $message);
        return response()->json([
            'status' => true,
            'message' => $message
        ]);
    }

    public function saveJobDetail(Request $request){
        $id=$request->id;
        $job=Job::find($id);

        if($job==null){
            session()->flash('error', 'Job not found');
            return response()->json([
                'status' => false,
            ]);
        }

        $count=Savedjob::where(['job_id'=>$id,'user_id'=>Auth::user()->id])->count();

        if($count>0){
            session()->flash('error', 'You already saved on this job.');
            return response()->json([
                'status' => false,
            ]);
        }

        $savedJob=new SavedJob;
        $savedJob->job_id=$id;
        $savedJob->user_id=Auth::user()->id;
        $savedJob->save();
            session()->flash('success', 'You have successfully saved the job.');
            return response()->json([
                'status' => true
            ]);
    }
}
