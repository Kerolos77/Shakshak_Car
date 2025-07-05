// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Enroll now`
  String get enrollNow {
    return Intl.message('Enroll now', name: 'enrollNow', desc: '', args: []);
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Welcome Back! We are happy to have you back`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back! We are happy to have you back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `By tapping`
  String get byTapping {
    return Intl.message('By tapping', name: 'byTapping', desc: '', args: []);
  }

  /// `you agree to `
  String get agreeTo {
    return Intl.message('you agree to ', name: 'agreeTo', desc: '', args: []);
  }

  /// ` and `
  String get and {
    return Intl.message(' and ', name: 'and', desc: '', args: []);
  }

  /// `Terms and conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms and conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email and password to log in`
  String get enterYourEmailAndPasswordToLogin {
    return Intl.message(
      'Enter your email and password to log in',
      name: 'enterYourEmailAndPasswordToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Activate`
  String get activate {
    return Intl.message('Activate', name: 'activate', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Enter the 6-digit code sent to your phone`
  String get enterTheCodeSentToYourPhone {
    return Intl.message(
      'Enter the 6-digit code sent to your phone',
      name: 'enterTheCodeSentToYourPhone',
      desc: '',
      args: [],
    );
  }

  /// `Login as :`
  String get loginAs {
    return Intl.message('Login as :', name: 'loginAs', desc: '', args: []);
  }

  /// `Don't have an account ?`
  String get noAccount {
    return Intl.message(
      'Don\'t have an account ?',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signup {
    return Intl.message('Sign Up', name: 'signup', desc: '', args: []);
  }

  /// `Please select a role first`
  String get pleaseChooseRole {
    return Intl.message(
      'Please select a role first',
      name: 'pleaseChooseRole',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `User`
  String get user {
    return Intl.message('User', name: 'user', desc: '', args: []);
  }

  /// `Need a safe drive`
  String get userDescription {
    return Intl.message(
      'Need a safe drive',
      name: 'userDescription',
      desc: '',
      args: [],
    );
  }

  /// `Driver`
  String get driver {
    return Intl.message('Driver', name: 'driver', desc: '', args: []);
  }

  /// `Provide a safe drive for users`
  String get driverDescription {
    return Intl.message(
      'Provide a safe drive for users',
      name: 'driverDescription',
      desc: '',
      args: [],
    );
  }

  /// `Where do you want to go?`
  String get whereYouWantToGo {
    return Intl.message(
      'Where do you want to go?',
      name: 'whereYouWantToGo',
      desc: '',
      args: [],
    );
  }

  /// `Lorem Ipsum is simply dummy text of the printing and typesetting industry.`
  String get loremMessage {
    return Intl.message(
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      name: 'loremMessage',
      desc: '',
      args: [],
    );
  }

  /// `Enter pickup location`
  String get pickupLocation {
    return Intl.message(
      'Enter pickup location',
      name: 'pickupLocation',
      desc: '',
      args: [],
    );
  }

  /// `Enter drop-off location`
  String get dropoffLocation {
    return Intl.message(
      'Enter drop-off location',
      name: 'dropoffLocation',
      desc: '',
      args: [],
    );
  }

  /// `Enter your offer rate`
  String get enterOfferRate {
    return Intl.message(
      'Enter your offer rate',
      name: 'enterOfferRate',
      desc: '',
      args: [],
    );
  }

  /// `Select payment method`
  String get selectPaymentMethod {
    return Intl.message(
      'Select payment method',
      name: 'selectPaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get cash {
    return Intl.message('Cash', name: 'cash', desc: '', args: []);
  }

  /// `Wallet`
  String get wallet {
    return Intl.message('Wallet', name: 'wallet', desc: '', args: []);
  }

  /// `Book ride`
  String get bookRide {
    return Intl.message('Book ride', name: 'bookRide', desc: '', args: []);
  }

  /// `hello to our app`
  String get helloToOurApp {
    return Intl.message(
      'hello to our app',
      name: 'helloToOurApp',
      desc: '',
      args: [],
    );
  }

  /// `Select vehicle`
  String get selectVehicle {
    return Intl.message(
      'Select vehicle',
      name: 'selectVehicle',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Outstation`
  String get outstation {
    return Intl.message('Outstation', name: 'outstation', desc: '', args: []);
  }

  /// `Rides`
  String get rides {
    return Intl.message('Rides', name: 'rides', desc: '', args: []);
  }

  /// `Outstation rides`
  String get outstationRides {
    return Intl.message(
      'Outstation rides',
      name: 'outstationRides',
      desc: '',
      args: [],
    );
  }

  /// `My wallet`
  String get myWallet {
    return Intl.message('My wallet', name: 'myWallet', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Contact us`
  String get contactUs {
    return Intl.message('Contact us', name: 'contactUs', desc: '', args: []);
  }

  /// `FAQs`
  String get faqs {
    return Intl.message('FAQs', name: 'faqs', desc: '', args: []);
  }

  /// `Call Us`
  String get callUs {
    return Intl.message('Call Us', name: 'callUs', desc: '', args: []);
  }

  /// `Email Us`
  String get emailUs {
    return Intl.message('Email Us', name: 'emailUs', desc: '', args: []);
  }

  /// `Call`
  String get call {
    return Intl.message('Call', name: 'call', desc: '', args: []);
  }

  /// `Location`
  String get location {
    return Intl.message('Location', name: 'location', desc: '', args: []);
  }

  /// `Write us`
  String get writeUs {
    return Intl.message('Write us', name: 'writeUs', desc: '', args: []);
  }

  /// `Describe your issue`
  String get describeIssue {
    return Intl.message(
      'Describe your issue',
      name: 'describeIssue',
      desc: '',
      args: [],
    );
  }

  /// `Describe your issue and feedback`
  String get describeFeedback {
    return Intl.message(
      'Describe your issue and feedback',
      name: 'describeFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message('Submit', name: 'submit', desc: '', args: []);
  }

  /// `From`
  String get from {
    return Intl.message('From', name: 'from', desc: '', args: []);
  }

  /// `To`
  String get to {
    return Intl.message('To', name: 'to', desc: '', args: []);
  }

  /// `When`
  String get when {
    return Intl.message('When', name: 'when', desc: '', args: []);
  }

  /// `Number of passengers`
  String get numberOfPassengers {
    return Intl.message(
      'Number of passengers',
      name: 'numberOfPassengers',
      desc: '',
      args: [],
    );
  }

  /// `Place ride`
  String get placeRide {
    return Intl.message('Place ride', name: 'placeRide', desc: '', args: []);
  }

  /// `Active\nRides`
  String get activeRides {
    return Intl.message(
      'Active\nRides',
      name: 'activeRides',
      desc: '',
      args: [],
    );
  }

  /// `Completed\nRides`
  String get completedRides {
    return Intl.message(
      'Completed\nRides',
      name: 'completedRides',
      desc: '',
      args: [],
    );
  }

  /// `Canceled\nRides`
  String get canceledRides {
    return Intl.message(
      'Canceled\nRides',
      name: 'canceledRides',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Light/Dark theme`
  String get lightDarkTheme {
    return Intl.message(
      'Light/Dark theme',
      name: 'lightDarkTheme',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `Light`
  String get light {
    return Intl.message('Light', name: 'light', desc: '', args: []);
  }

  /// `Dark`
  String get dark {
    return Intl.message('Dark', name: 'dark', desc: '', args: []);
  }

  /// `Total Balance`
  String get totalBalance {
    return Intl.message(
      'Total Balance',
      name: 'totalBalance',
      desc: '',
      args: [],
    );
  }

  /// `Topup wallet`
  String get topupWallet {
    return Intl.message(
      'Topup wallet',
      name: 'topupWallet',
      desc: '',
      args: [],
    );
  }

  /// `Deposit`
  String get deposit {
    return Intl.message('Deposit', name: 'deposit', desc: '', args: []);
  }

  /// `Transaction ID`
  String get transactionId {
    return Intl.message(
      'Transaction ID',
      name: 'transactionId',
      desc: '',
      args: [],
    );
  }

  /// `Paid Via`
  String get paidVia {
    return Intl.message('Paid Via', name: 'paidVia', desc: '', args: []);
  }

  /// `Date`
  String get date {
    return Intl.message('Date', name: 'date', desc: '', args: []);
  }

  /// `Status`
  String get status {
    return Intl.message('Status', name: 'status', desc: '', args: []);
  }

  /// `I have my own account?`
  String get iHaveMyOwnAccount {
    return Intl.message(
      'I have my own account?',
      name: 'iHaveMyOwnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Done successfully`
  String get doneSuccessfully {
    return Intl.message(
      'Done successfully',
      name: 'doneSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Error occurred`
  String get errorOccurred {
    return Intl.message(
      'Error occurred',
      name: 'errorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `Choose location`
  String get chooseLocation {
    return Intl.message(
      'Choose location',
      name: 'chooseLocation',
      desc: '',
      args: [],
    );
  }

  /// `User name`
  String get userName {
    return Intl.message('User name', name: 'userName', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Mobile number`
  String get mobileNumber {
    return Intl.message(
      'Mobile number',
      name: 'mobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `DeleteAccount`
  String get deleteAccount {
    return Intl.message(
      'DeleteAccount',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message('Support', name: 'support', desc: '', args: []);
  }

  /// `Online registration`
  String get onlineRegistration {
    return Intl.message(
      'Online registration',
      name: 'onlineRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle information`
  String get vehicleInformation {
    return Intl.message(
      'Vehicle information',
      name: 'vehicleInformation',
      desc: '',
      args: [],
    );
  }

  /// `Car number`
  String get carNumber {
    return Intl.message('Car number', name: 'carNumber', desc: '', args: []);
  }

  /// `Car brand`
  String get carBrand {
    return Intl.message('Car brand', name: 'carBrand', desc: '', args: []);
  }

  /// `Car color`
  String get carColor {
    return Intl.message('Car color', name: 'carColor', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `New`
  String get newRide {
    return Intl.message('New', name: 'newRide', desc: '', args: []);
  }

  /// `Active`
  String get active {
    return Intl.message('Active', name: 'active', desc: '', args: []);
  }

  /// `Completed`
  String get completed {
    return Intl.message('Completed', name: 'completed', desc: '', args: []);
  }

  /// `Weight:`
  String get weight {
    return Intl.message('Weight:', name: 'weight', desc: '', args: []);
  }

  /// `Dimension:`
  String get dimension {
    return Intl.message('Dimension:', name: 'dimension', desc: '', args: []);
  }

  /// `Image:`
  String get image {
    return Intl.message('Image:', name: 'image', desc: '', args: []);
  }

  /// `Car model`
  String get carModel {
    return Intl.message('Car model', name: 'carModel', desc: '', args: []);
  }

  /// `Select car model`
  String get selectCarModel {
    return Intl.message(
      'Select car model',
      name: 'selectCarModel',
      desc: '',
      args: [],
    );
  }

  /// `National ID birth date`
  String get nationalIdBirthDate {
    return Intl.message(
      'National ID birth date',
      name: 'nationalIdBirthDate',
      desc: '',
      args: [],
    );
  }

  /// `Criminal record`
  String get criminalRecord {
    return Intl.message(
      'Criminal record',
      name: 'criminalRecord',
      desc: '',
      args: [],
    );
  }

  /// `National ID`
  String get nationalId {
    return Intl.message('National ID', name: 'nationalId', desc: '', args: []);
  }

  /// `Licence`
  String get licence {
    return Intl.message('Licence', name: 'licence', desc: '', args: []);
  }

  /// `Car licence`
  String get carLicence {
    return Intl.message('Car licence', name: 'carLicence', desc: '', args: []);
  }

  /// `Car`
  String get car {
    return Intl.message('Car', name: 'car', desc: '', args: []);
  }

  /// `Send Docs`
  String get sendDocs {
    return Intl.message('Send Docs', name: 'sendDocs', desc: '', args: []);
  }

  /// `ID Number`
  String get idNumber {
    return Intl.message('ID Number', name: 'idNumber', desc: '', args: []);
  }

  /// `Select expire date`
  String get selectExpireDate {
    return Intl.message(
      'Select expire date',
      name: 'selectExpireDate',
      desc: '',
      args: [],
    );
  }

  /// `Front Side`
  String get frontSide {
    return Intl.message('Front Side', name: 'frontSide', desc: '', args: []);
  }

  /// `Back Side`
  String get backSide {
    return Intl.message('Back Side', name: 'backSide', desc: '', args: []);
  }

  /// `Selfie with National ID`
  String get selfieWithId {
    return Intl.message(
      'Selfie with National ID',
      name: 'selfieWithId',
      desc: '',
      args: [],
    );
  }

  /// `Selfie with License`
  String get selfieWithLicense {
    return Intl.message(
      'Selfie with License',
      name: 'selfieWithLicense',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message('Done', name: 'done', desc: '', args: []);
  }

  /// `Please add all required images`
  String get pleaseAddAllImages {
    return Intl.message(
      'Please add all required images',
      name: 'pleaseAddAllImages',
      desc: '',
      args: [],
    );
  }

  /// `Trip map`
  String get tripMap {
    return Intl.message('Trip map', name: 'tripMap', desc: '', args: []);
  }

  /// `Accept fare on {price}`
  String acceptFareOn(Object price) {
    return Intl.message(
      'Accept fare on $price',
      name: 'acceptFareOn',
      desc: '',
      args: [price],
    );
  }

  /// `No trips right now...`
  String get noTripsNow {
    return Intl.message(
      'No trips right now...',
      name: 'noTripsNow',
      desc: '',
      args: [],
    );
  }

  /// `Online`
  String get online {
    return Intl.message('Online', name: 'online', desc: '', args: []);
  }

  /// `Offline`
  String get offline {
    return Intl.message('Offline', name: 'offline', desc: '', args: []);
  }

  /// `Add topup amount`
  String get addTopupAmount {
    return Intl.message(
      'Add topup amount',
      name: 'addTopupAmount',
      desc: '',
      args: [],
    );
  }

  /// `Enter amount`
  String get enterAmount {
    return Intl.message(
      'Enter amount',
      name: 'enterAmount',
      desc: '',
      args: [],
    );
  }

  /// `Topup`
  String get topup {
    return Intl.message('Topup', name: 'topup', desc: '', args: []);
  }

  /// `Withdraw`
  String get withdraw {
    return Intl.message('Withdraw', name: 'withdraw', desc: '', args: []);
  }

  /// `Withdrawal`
  String get withdrawal {
    return Intl.message('Withdrawal', name: 'withdrawal', desc: '', args: []);
  }

  /// `Add withdraw amount`
  String get addWithdrawAmount {
    return Intl.message(
      'Add withdraw amount',
      name: 'addWithdrawAmount',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message('Notes', name: 'notes', desc: '', args: []);
  }

  /// `Withdrawal History`
  String get withdrawalHistory {
    return Intl.message(
      'Withdrawal History',
      name: 'withdrawalHistory',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw requests`
  String get withdrawRequests {
    return Intl.message(
      'Withdraw requests',
      name: 'withdrawRequests',
      desc: '',
      args: [],
    );
  }

  /// `Select country`
  String get selectCountry {
    return Intl.message(
      'Select country',
      name: 'selectCountry',
      desc: '',
      args: [],
    );
  }

  /// `Select city`
  String get selectCity {
    return Intl.message('Select city', name: 'selectCity', desc: '', args: []);
  }

  /// `Country is required`
  String get countryIsRequired {
    return Intl.message(
      'Country is required',
      name: 'countryIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `City is required`
  String get cityIsRequired {
    return Intl.message(
      'City is required',
      name: 'cityIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordRequired {
    return Intl.message(
      'Password is required',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get passwordMinLength {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'passwordMinLength',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your password`
  String get confirmPasswordRequired {
    return Intl.message(
      'Please confirm your password',
      name: 'confirmPasswordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Name is required`
  String get nameRequired {
    return Intl.message(
      'Name is required',
      name: 'nameRequired',
      desc: '',
      args: [],
    );
  }

  /// `OTP is required`
  String get otpRequired {
    return Intl.message(
      'OTP is required',
      name: 'otpRequired',
      desc: '',
      args: [],
    );
  }

  /// `Photo is required`
  String get photoRequired {
    return Intl.message(
      'Photo is required',
      name: 'photoRequired',
      desc: '',
      args: [],
    );
  }

  /// `Street name is required`
  String get streetNameRequired {
    return Intl.message(
      'Street name is required',
      name: 'streetNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Building is required`
  String get buildingRequired {
    return Intl.message(
      'Building is required',
      name: 'buildingRequired',
      desc: '',
      args: [],
    );
  }

  /// `Floor is required`
  String get floorRequired {
    return Intl.message(
      'Floor is required',
      name: 'floorRequired',
      desc: '',
      args: [],
    );
  }

  /// `Apartment is required`
  String get apartmentRequired {
    return Intl.message(
      'Apartment is required',
      name: 'apartmentRequired',
      desc: '',
      args: [],
    );
  }

  /// `Gender is required`
  String get genderRequired {
    return Intl.message(
      'Gender is required',
      name: 'genderRequired',
      desc: '',
      args: [],
    );
  }

  /// `Age is required`
  String get ageRequired {
    return Intl.message(
      'Age is required',
      name: 'ageRequired',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is required`
  String get phoneRequired {
    return Intl.message(
      'Phone number is required',
      name: 'phoneRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Saudi phone number`
  String get invalidPhone {
    return Intl.message(
      'Invalid Saudi phone number',
      name: 'invalidPhone',
      desc: '',
      args: [],
    );
  }

  /// `Email or phone number is required`
  String get emailOrPhoneRequired {
    return Intl.message(
      'Email or phone number is required',
      name: 'emailOrPhoneRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address`
  String get invalidEmail {
    return Intl.message(
      'Invalid email address',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get or {
    return Intl.message('or', name: 'or', desc: '', args: []);
  }

  /// `a valid Saudi phone number`
  String get validPhone {
    return Intl.message(
      'a valid Saudi phone number',
      name: 'validPhone',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get emailRequired {
    return Intl.message(
      'Email is required',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `National ID is required`
  String get nationalIdRequired {
    return Intl.message(
      'National ID is required',
      name: 'nationalIdRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid National ID`
  String get invalidNationalId {
    return Intl.message(
      'Invalid National ID',
      name: 'invalidNationalId',
      desc: '',
      args: [],
    );
  }

  /// `Date of birth is required`
  String get dobRequired {
    return Intl.message(
      'Date of birth is required',
      name: 'dobRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid date of birth`
  String get invalidDob {
    return Intl.message(
      'Invalid date of birth',
      name: 'invalidDob',
      desc: '',
      args: [],
    );
  }

  /// `Account registered successfully`
  String get accountRegisteredSuccessfully {
    return Intl.message(
      'Account registered successfully',
      name: 'accountRegisteredSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Offer your fare`
  String get offerYourFare {
    return Intl.message(
      'Offer your fare',
      name: 'offerYourFare',
      desc: '',
      args: [],
    );
  }

  /// `EGP  `
  String get egpPrefix {
    return Intl.message('EGP  ', name: 'egpPrefix', desc: '', args: []);
  }

  /// `Promo code`
  String get promoCode {
    return Intl.message('Promo code', name: 'promoCode', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
