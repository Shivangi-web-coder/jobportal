<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\File;
use App\Models\User;
use App\Models\Category;
use App\Models\JobType;
use App\Models\Job;
use App\Models\JobApplication;
use App\Models\SavedJob;
use App\Mail\ResetPasswordEmail;
use Intervention\Image\Facades\Image;

class AccountController extends Controller
{
    public function registration()
    {
        return view('front.account.registration');
    }

    public function processRegistration(Request $request)
    {
        $validator = validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|min:5|same:confirm_password',
            'confirm_password' => 'required',
        ]);
        if ($validator->passes()) {
            $user = new User();
            $user->name = $request->name;
            $user->email = $request->email;
            $user->password = Hash::make($request->password);
            $user->save();
            session()->flash('success', 'You have registered successfully.');
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

    public function login()
    {
        return view('front.account.login');
    }

    public function authenticate(Request $request)
    {
        $validator = validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if ($validator->passes()) {
            if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
                return redirect()->route('account.profile');
            } else {
                return redirect()->route('account.login')->with('error', 'Either Email/Password is incorrect');
            }
        } else {
            return redirect()->route('account.login')->withErrors($validator)->withInput($request->only('email'));
        }
    }

    public function profile()
    {
        $id = Auth::user()->id;
        $user = User::where('id', $id)->first();
        return view('front.account.profile', ['user' => $user]);
    }

    public function updateProfile(Request $request)
    {
        $id = Auth::user()->id;
        $validator = validator::make($request->all(), [
            'name' => 'required|min:5|max:20',
            'email' => 'required|email|unique:users,email,' . $id . ',id'
        ]);
        if ($validator->passes()) {
            $user = User::find($id);
            $user->name = $request->name;
            $user->email = $request->email;
            $user->designation = $request->designation;
            $user->mobile = $request->mobile;
            $user->save();
            session()->flash('success', 'Profile updated successfully.');
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

    public function logout()
    {
        Auth::logout();
        return redirect()->route('account.login');
    }

    public function updateProfilePic(Request $request)
    {
        $id = Auth::user()->id;
        $validator = validator::make($request->all(), [
            'image' => 'required|image',
        ]);
        if ($validator->passes()) {
            $image = Image::make($request->file('image'));
            //Main Image Upload on Folder Code
            $imageName = time() . '-' . $request->file('image')->getClientOriginalName();
            $destinationPath = public_path('profile_pic/');
            $image->save($destinationPath . $imageName);
            //Generate Thumbnail Image Upload on Folder Code
            $destinationPathThumbnail = public_path('profile_pic/thumb/');
            $image->resize(150, 150);
            $image->save($destinationPathThumbnail . $imageName);

            $user = Auth::user();
            // Path to the profile pictures and thumbnails
            $profilePicPath = public_path('/profile_pic/');
            $thumbnailPath = public_path('/profile_pic/thumb/');

            // Delete old profile picture and thumbnail if they exist
            if (!empty($user->image)) {
                $oldProfilePicture = $profilePicPath . $user->image;
                $oldThumbnail = $thumbnailPath . $user->image;

                if (file_exists($oldProfilePicture) && !is_dir($oldProfilePicture)) {
                    unlink($oldProfilePicture);
                }
                if (file_exists($oldThumbnail) && !is_dir($oldThumbnail)) {
                    unlink($oldThumbnail);
                }
            }

            User::where('id', $id)->update(['image' => $imageName]);
            session()->flash('success', 'Profile picture updated successfully.');

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

    public function createJob()
    {
        $categories = Category::orderBy('name', 'Asc')->where('status', 1)->get();
        $jobType = JobType::orderBy('name', 'Asc')->where('status', 1)->get();
        return view('front.account.job.createJob', ['categories' => $categories, 'jobType' => $jobType]);
    }

    public function saveJob(Request $request)
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
            $job = new Job();
            $job->title = $request->title;
            $job->category_id = $request->category;
            $job->job_type_id = $request->jobType;
            $job->user_id = Auth::user()->id;
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
            $job->save();
            session()->flash('success', 'Job saved successfully.');
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

    public function myJobs()
    {
        $jobs = Job::where('user_id', Auth::user()->id)->with('jobType')->orderBy('created_at', 'DESC')->paginate(10);
        return view('front.account.job.myJobs', ['jobs' => $jobs]);
    }

    public function editJob(Request $request, $id)
    {
        $categories = Category::orderBy('name', 'Asc')->where('status', 1)->get();
        $jobType = JobType::orderBy('name', 'Asc')->where('status', 1)->get();
        $jobs = Job::where(['user_id' => Auth::user()->id, 'id' => $id])->first();
        if ($jobs == null) {
            abort(404);
        }
        return view('front.account.job.editJob', ['categories' => $categories, 'jobType' => $jobType, 'jobs' => $jobs]);
    }

    public function updateJob(Request $request, $id)
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
            $job->user_id = Auth::user()->id;
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

    public function deleteJob(Request $request)
    {
        $job = Job::where(['user_id' => Auth::user()->id, 'id' => $request->jobId])->first();

        if ($job == null) {
            session()->flash('success', 'Either job deleted or not found.');
            return response()->json([
                'status' => true
            ]);
        }

        Job::where('id', $request->jobId)->delete();
        session()->flash('success', 'Job deleted successfully.');
        return response()->json([
            'status' => true
        ]);
    }

    public function myJobApplications()
    {
        $jobApplications=JobApplication::where('user_id',Auth::user()->id)->with(['job','job.jobType','job.applications'])->paginate(10);
        return view('front.account.job.my-job-applications',['jobApplications'=>$jobApplications]);
    }

    public function removeJobApplications(Request $request)
    {
        $jobApplication = JobApplication::where(['user_id' => Auth::user()->id, 'id' => $request->id])->first();

        if ($jobApplication == null) {
            session()->flash('success', 'Job application not found.');
            return response()->json([
                'status' => false
            ]);
        }

        JobApplication::where('id', $request->id)->delete();
        session()->flash('success', 'Job application removed successfully.');
        return response()->json([
            'status' => true
        ]);
    }

    public function savedJobs()
    {
        $savedJobs=SavedJob::where('user_id',Auth::user()->id)->with(['job','job.jobType', 'job.applications'])->orderBy('created_at','DESC')->paginate(10);
        return view('front.account.job.saved-jobs',['savedJobs'=>$savedJobs]);
    }

    public function removeSavedJobs(Request $request)
    {
        $savedJob = SavedJob::where(['user_id' => Auth::user()->id, 'id' => $request->id])->first();

        if ($savedJob == null) {
            session()->flash('success', 'Job not found.');
            return response()->json([
                'status' => false
            ]);
        }

        SavedJob::where('id', $request->id)->delete();
        session()->flash('success', 'Job removed successfully.');
        return response()->json([
            'status' => true
        ]);
    }

    public function updatePassword(Request $request){
        $validator = validator::make($request->all(), [
            'old_password' => 'required',
            'new_password' => 'required|min:5',
            'confirm_password' => 'required|same:new_password',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }

        if(Hash::check($request->old_password,Auth::user()->password)==false){
            session()->flash('error','Your old password is incorrect');
            return response()->json([
                'status' => true,
            ]);
        }

        $user=User::find(Auth::user()->id);
        $user->password=Hash::make($request->new_password);
        $user->save();

        session()->flash('success','Password updated successfully');
            return response()->json([
                'status' => true,
            ]);
    }

    public function forgotPassword(){
        return view('front.account.forgot-password');
    }

    public function processForgotPassword(Request $request){
        $validator = validator::make($request->all(), [
            'email' => 'required|email|exists:users,email'
        ]);
        if ($validator->fails()) {
            return redirect()->route('account.forgotPassword')->withInput()->withErrors($validator);
        }

        $token=Str::random(60);

        DB::table('password_resets')->where('email',$request->email)->delete();
        DB::table('password_resets')->insert([
            'email'=>$request->email,
            'token'=>$token,
            'created_at'=>now()
        ]);

        //send mail to reset password
        $user=User::where('email',$request->email)->first();
        $mailData=[
            'user'=>$user,
            'token'=>$token,
            'subject'=>'You have requested to change your password'
        ];
        Mail::to($request->email)->send(new ResetPasswordEmail($mailData));

        return redirect()->route('account.forgotPassword')->with('success','Reset password has been sent to your inbox.');
    }

    public function resetPassword($tokenStr){
        $token=DB::table('password_resets')->where('token',$tokenStr)->first();
        if($token==null){
        return redirect()->route('account.forgotPassword')->with('error','Invalid token.');
        }

        return view('front.account.reset-password',['tokenStr'=>$tokenStr]);
    }

    public function processResetPassword(Request $request){
        $token=DB::table('password_resets')->where('token',$request->token)->first();
        if($token==null){
        return redirect()->route('account.forgotPassword')->with('error','Invalid token.');
        }
        $validator = validator::make($request->all(), [
            'new_password' => 'required|min:5',
            'confirm_password' => 'required|same:new_password',
        ]);
        if ($validator->fails()) {
            return redirect()->route('account.resetPassword',$request->token)->withInput()->withErrors($validator);
        }

        User::where('email',$token->email)->update(['password'=>Hash::make($request->new_password)]);
        return redirect()->route('account.login')->with('success','You have successfully changes your password.');
    }
}
