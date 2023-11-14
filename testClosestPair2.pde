import java.util.Collections;
import java.util.Comparator;

int N = 100;
ArrayList<PVector> points = new ArrayList<PVector>();

void setup() {
  size(500, 500);

  println("Cas pour " + N + " points :");
  //Création des points
  for (int i = 0; i < N; i++) {
    points.add(new PVector(random(width), random(height)));
  }
  strokeWeight(2);
  stroke(0);

  //FORCE BRUTE
  float tmp = millis();
  Result rfb = bruteForce(0, N - 1);
  println("Distance min FB = " + rfb.distance + " (" + (millis() - tmp) + "ms)");
  println("Points: " + points.get(rfb.imin) + " / " + points.get(rfb.jmin)); 

  //DIVISER POUR REGNER
  tmp = millis();
  Collections.sort(points, new LexicalComparison());  
  float tmp2 = millis();
  Result rdpr = closestUtil(0, N - 1);
  println("Distance min DPR = " + rdpr.distance + " (" + (millis() - tmp) + "ms dont " + 
    (tmp2 - tmp) + "ms pour tri)");
  println("Points: " + points.get(rdpr.imin) + " / " + points.get(rdpr.jmin)); 


  noLoop();
}

void draw() {
  background(255);
  stroke(0);
  strokeWeight(2);
  for (PVector point : points) {
    point(point.x, point.y);
  }
}
