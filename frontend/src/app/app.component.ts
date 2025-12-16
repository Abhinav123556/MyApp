import { Component, OnInit } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';

interface WeatherForecast {
  date: string;
  temperatureC: number;
  temperatureF: number;
  summary: string;
}

@Component({
  selector: 'app-root',
  template: `
    <div style="padding: 20px; font-family: Arial, sans-serif;">
      <h1>🌤️ Weather Forecast App</h1>
      <p>Built with Angular 21, .NET 10, Node.js 25</p>
      
      <div *ngIf="loading" style="color: blue;">
        Loading weather data...
      </div>
      
      <div *ngIf="error" style="color: red;">
        Error: {{ error }}
      </div>
      
      <div *ngIf="forecasts && forecasts.length > 0">
        <h2>📅 5-Day Forecast</h2>
        <table border="1" cellpadding="10" style="border-collapse: collapse;">
          <thead>
            <tr>
              <th>Date</th>
              <th>Temperature (°C)</th>
              <th>Temperature (°F)</th>
              <th>Summary</th>
            </tr>
          </thead>
          <tbody>
            <tr *ngFor="let forecast of forecasts">
              <td>{{ forecast.date }}</td>
              <td>{{ forecast.temperatureC }}°C</td>
              <td>{{ forecast.temperatureF }}°F</td>
              <td>{{ forecast.summary }}</td>
            </tr>
          </tbody>
        </table>
      </div>
      
      <div style="margin-top: 30px; padding: 15px; background: #f5f5f5;">
        <h3>🛠️ Tech Stack</h3>
        <ul>
          <li>Angular CLI: 21.0.3</li>
          <li>Node.js: 25.2.1</li>
          <li>.NET: 10.0.101</li>
          <li>GitHub Actions CI/CD</li>
        </ul>
      </div>
    </div>
  `,
  styles: []
})
export class AppComponent implements OnInit {
  forecasts: WeatherForecast[] = [];
  loading = true;
  error: string | null = null;

  constructor(private http: HttpClient) {}

  ngOnInit() {
    this.loadWeatherData();
  }

  loadWeatherData() {
    this.loading = true;
    this.error = null;
    
    this.http.get<WeatherForecast[]>('/api/weather')
      .subscribe({
        next: (data: WeatherForecast[]) => {
          this.forecasts = data;
          this.loading = false;
        },
        error: (err: HttpErrorResponse) => {
          this.error = 'Failed to load weather data. Make sure backend is running.';
          this.loading = false;
          console.error('Error loading weather data:', err);
        }
      });
  }
}