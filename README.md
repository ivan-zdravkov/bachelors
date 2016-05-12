# Ivan Zdravkov - Design and implementation of a system for online payments and access to services #

* An English review of the graduation thesis (originally in bulgarian) can be downloaded here: [English Review.docx](https://bitbucket.org/ivanzdravkovdiplomproject/diplom-project/src/78b51d42ddcfc7057429f4af163259b164e532d5/English%20Review.docx?fileviewer=file-view-default)

* The full graduation thesis in bulgarian can be downloaded here: [Дипломна работа - Иван Здравков.docx](https://bitbucket.org/ivanzdravkovdiplomproject/diplom-project/src/a65674b14aee1b2be7742553484562b447e7fca8/%D0%94%D0%B8%D0%BF%D0%BB%D0%BE%D0%BC%D0%BD%D0%B0%20%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%B0%20-%20%D0%98%D0%B2%D0%B0%D0%BD%20%D0%97%D0%B4%D1%80%D0%B0%D0%B2%D0%BA%D0%BE%D0%B2.docx?at=develop)

## Formulation of the problem ##
* The task is to design and implement a web-based system that governs the process of payment and access control for a network of sports facilities. A client of the facilities uses PayPal to pay his monthly subscription or a predefined number of practices, and is issued an RFID card that can be used to verify his legitimacy to access the facilities.  The system should also keep track of his payment and attendance histories.

## Architecture ##
* Client-server MVC (Model View Controller) application using external services (PayPal API for payment processing, Yahoo! Finance Info for the currency exchange Rates, etc). As an extra to the classical 3-layer model are employed a Data Layer and an ORM models.


## Back End Technologies ## 
* ASP.NET MVC 5.0
* ASP.NET Web Api 2.0
* ASP.NET Identity 1.0
* ASP.NET Razor View Engine
* Entity Framework 6.1.0
* MSSQL
* C# 5.0

## Front End Technologies ## 
* HTML 5
* CSS 3
* JavaScript 
* jQuery
* jQuery Validate
* Modernizr
* Bootstrap
* Knockout

## Development Tools ## 
* Visual Studio 2013
* SQL Server 2012
* Fiddler
* Google Chrome F12 Developer Tools