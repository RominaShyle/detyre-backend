<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Schema;
use Carbon\Carbon;

use App\Models\Product;
use App\Models\DetailsData;
use App\Models\HeaderData;
use Validator;

class ProductController extends Controller
{
    

    public function create(Request $request){
        $validator = Validator::make($request->all(), 
        [ 
        'file' => 'required|mimes:xml',
       ]);  
       if ($validator->fails()) {          
        return response()->json(['error'=>$validator->errors()], 401);                        
     }   

     if ($files = $request->file('file')) {

        $xmlDataString = file_get_contents($files);
        $xmlObject = simplexml_load_string($xmlDataString);
        $json = json_encode($xmlObject);
        $phpDataArray = json_decode($json, true); 
        $product = new Product();
     $tmp = [];
     $tmpDetails = [];
     $tmpHeader = [];
     
     foreach($phpDataArray as $key=>$value){

            if($value == 'false'){
                $value = 0;
            }else if($value == 'true'){
                $value = 1;
            }
            if($key != 'definitions'){
                $tmp[$this->from_camel_case($key)] = $value;
            }
        }
        
    }

    $validator = Validator::make($tmp, 
        [ 
        'product_id' => 'required|unique:product',
       ]);  
       if ($validator->fails()) {          
        return response()->json(['error'=>$validator->errors()], 401);                        
     }   else {
   $product= Product::create($tmp);
$product_id = $product->id;


    foreach($phpDataArray as $key=>$value){
        if($value == 'false'){
            $value = 0;
        }else if($value == 'true'){
            $value = 1;
        }
        if($key == 'definitions'){
            foreach($value['detailsData'] as $k=>$v){
                foreach($v as $i=>$k){
                    if($k == 'false'){
                        $k = 0;
                    }else if($k == 'true'){
                        $k = 1;
                    }
                    $tmpDetails[$this->from_camel_case($i)] = $k;

                }
                $tmpDetails['product_id'] = intval($product_id);
                $detail = new DetailsData;
                $detail->insert($tmpDetails);

            }

           
            foreach($value['headerData'] as $a=>$b){
                    if($b == 'false'){
                        $b = 0;
                    }else if($b == 'true'){
                        $b = 1;
                    }
                    else if ($b == []){
                        $b = '';
                    }
                    if($a == 'creationDateInDatabase'){
                       
                        $timestamp = strtotime($b);
                        $tmpHeader['date']= date("Y-m-d H:i:s", $timestamp);
                        // dd($tmpHeader);
                    }
                    if($a == 'lastDateChanged'){
                       
                        $timestamp = strtotime($b);
                        $tmpHeader['changed']= date("Y-m-d H:i:s", $timestamp);
                        // dd($tmpHeader);
                    }
                   
                    if($a != 'product_features' && $a != 'product_missing_features'){
                        // dd($value['headerData']);
                        if($isColExist = Schema::connection("mysql")->hasColumn('header_data',$this->from_camel_case($a))){
                            
                            $tmpHeader[$this->from_camel_case($a)] = $b;

                        }


                    }

            }
            $tmpHeader['creation_date_in_database'] = $tmpHeader['date'];
            $tmpHeader['last_date_changed'] = $tmpHeader['changed'];
            unset($tmpHeader['date']);
            unset($tmpHeader['changed']);
            $tmpHeader['product_id'] = intval($product->id);
            // dd($tmpHeader);
            $header = new HeaderData;
            $header->insert($tmpHeader);

          
        }
    }


    
        return response()->json([
            "success" => true,
            "message" => "File successfully uploaded",
           
        ]);
    }
}


public function from_camel_case($input) {
    preg_match_all('!([A-Z][A-Z0-9]*(?=$|[A-Z][a-z0-9])|[A-Za-z][a-z0-9]+)!', $input, $matches);
    $ret = $matches[0];
    foreach ($ret as &$match) {
      $match = $match == strtoupper($match) ? strtolower($match) : lcfirst($match);
    }
    return implode('_', $ret);
  }


  public function delete($id){

    $details = DetailsData::where('product_id',$id)->get();
    foreach($details as $detail){
        DetailsData::find($detail->id)->delete();
    }
    $header = HeaderData::where('product_id',$id)->get();
    foreach($header as $head){
        HeaderData::find($head->id)->delete();
    }
    $product = Product::find($id);
    if($product->delete()){
        return response()->json(['response', 'successfully deleted']);
    }

$flight->delete();




  }
}