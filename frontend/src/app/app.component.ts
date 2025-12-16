import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html'
})
export class AppComponent implements OnInit {
  myForm: FormGroup;
  weatherData: any;

  constructor(private fb: FormBuilder, private http: HttpClient) {
    this.myForm = this.fb.group({
      city: ['']
    });
  }

  ngOnInit() {
    // Example API call
    this.http.get<any>('/weather').subscribe((data: any) => {
      this.weatherData = data;
      console.log('Weather data:', data);
    });
  }

  submitForm() {
    const city = this.myForm.value.city;
    console.log('Form submitted. City:', city);

    // Example: fetch weather for entered city
    this.http.get<any>(`/weather?city=${city}`).subscribe((data: any) => {
      this.weatherData = data;
      console.log('Weather data for city:', data);
    });
  }
}
