<?php

namespace App\Models;
use App\Models\DetailsData;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    public $timestamps = false;

    protected $table = "product";
    protected $guarded = [];

    public function details()
    {
        return $this->hasMany(DetailsData::class);
    }
}
