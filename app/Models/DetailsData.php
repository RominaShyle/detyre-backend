<?php

namespace App\Models;
use App\Models\Product;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DetailsData extends Model
{
    use HasFactory;
    protected $table = 'details_data';
    protected $guarded = [];

    public $timestamps = false;
    
    public function product()
    {
        return $this->belongsToOne(Product::class);
    }
}
