Result closestUtil(int start, int end)  
{  
  // If there are 2 or 3 points, then use brute force  
  if ((end - start) <= 3)  
    return bruteForce(start, end);  

  // Find the middle point  
  //int mid = start + (end - start)/2;
  int mid = (start + end)/2;
  PVector midPoint = points.get(mid);  

  // Consider the vertical line passing  
  // through the middle point calculate  
  // the smallest distance dl on left  
  // of middle point and dr on right side  
  Result dl = closestUtil(start, mid);  
  Result dr = closestUtil(mid + 1, end);  

  // Find the smaller of two distances  
  Result d = (dl.distance < dr.distance) ? dl : dr;  

  // Check distances between points on the left and right   
  // of the line passing through the middle point (closer than d):
  // - Loop over points on the left side of the middle point
  // - Check distance with points on the right side and possibly replace d
  // - Terminate loops if horizontal distance is reached
  int iLeft = mid; 
  while ( (iLeft >= start) && (midPoint.x - points.get(iLeft).x < d.distance) ) {
    int iRight = mid + 1; 
    while ( (iRight <= end) && (points.get(iRight).x - midPoint.x < d.distance) ) {
      float dlr = points.get(iLeft).dist(points.get(iRight));
      if (dlr < d.distance) d = new Result(dlr, iLeft, iRight);
      iRight++;
    }
    iLeft--;
  }

  return d;
}  
