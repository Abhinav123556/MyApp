import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  standalone: false,   // 🔥 REQUIRED in Angular 17+
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'MyApp';
}
