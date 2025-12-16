import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';

import { AppComponent } from './app.component';

@NgModule({
  declarations: [AppComponent],
  imports: [
    BrowserModule,
    HttpClientModule,       // For HTTP requests
    FormsModule,            // Template-driven forms
    ReactiveFormsModule     // Reactive forms
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {}
