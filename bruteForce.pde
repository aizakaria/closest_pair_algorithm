Result bruteForce(int start, int end)  
{  
    Result r = new Result(width*height, -1, -1);
    for (int i = start; i <= end; ++i)  
        for (int j = i+1; j <= end; ++j)  {
          float d = points.get(i).dist(points.get(j));
          if (d < r.distance) r = new Result(d, i, j);
        } 
    return r;  
}  
