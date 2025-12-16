import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-root',
  template: `
    <div style="padding: 20px;">
      <h1>MyApp - CI/CD Demo</h1>
      <p>Built with Angular 21 + .NET 10</p>
      
      <div *ngIf="weatherData">
        <h3>Weather Forecast:</h3>
        <div *ngFor="let forecast of weatherData">
          <p>{{forecast.date}} - {{forecast.summary}} - {{forecast.temperatureC}}°C</p>
        </div>
      </div>
    </div>
  `
})
export class AppComponent implements OnInit {
  weatherData: any;

  constructor(private http: HttpClient) {}

  ngOnInit() {
    this.http.get('/weather').subscribe(data => {
      this.weatherData = data;
    });
  }
}