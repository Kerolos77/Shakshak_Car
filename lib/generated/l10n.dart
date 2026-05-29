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
    final name = (locale.countryCode?.isEmpty ?? false)
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

  /// `Edit profile`
  String get editProfile {
    return Intl.message(
      'Edit profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Active trip in progress`
  String get activeTrip {
    return Intl.message(
      'Active trip in progress',
      name: 'activeTrip',
      desc: '',
      args: [],
    );
  }

  /// `Track`
  String get track {
    return Intl.message('Track', name: 'track', desc: '', args: []);
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

  /// `or`
  String get or {
    return Intl.message('or', name: 'or', desc: '', args: []);
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

  /// `Verification`
  String get verification {
    return Intl.message(
      'Verification',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `S H A K S H A K C A R`
  String get appNameLogo {
    return Intl.message(
      'S H A K S H A K C A R',
      name: 'appNameLogo',
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

  /// `Hello to our app`
  String get helloToOurApp {
    return Intl.message(
      'Hello to our app',
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

  /// `Outstation ride`
  String get outStation {
    return Intl.message(
      'Outstation ride',
      name: 'outStation',
      desc: '',
      args: [],
    );
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

  /// `Delete account`
  String get deleteAccount {
    return Intl.message(
      'Delete account',
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

  /// `Confirm Order`
  String get confirmOrder {
    return Intl.message(
      'Confirm Order',
      name: 'confirmOrder',
      desc: '',
      args: [],
    );
  }

  /// `Please select a ride`
  String get pleaseSelectRide {
    return Intl.message(
      'Please select a ride',
      name: 'pleaseSelectRide',
      desc: '',
      args: [],
    );
  }

  /// `km`
  String get km {
    return Intl.message('km', name: 'km', desc: '', args: []);
  }

  /// `min`
  String get min {
    return Intl.message('min', name: 'min', desc: '', args: []);
  }

  /// `Choose ride type`
  String get chooseRideType {
    return Intl.message(
      'Choose ride type',
      name: 'chooseRideType',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get currency {
    return Intl.message('EGP', name: 'currency', desc: '', args: []);
  }

  /// `Choose on map`
  String get chooseOnMap {
    return Intl.message(
      'Choose on map',
      name: 'chooseOnMap',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Destination`
  String get confirmDestination {
    return Intl.message(
      'Confirm Destination',
      name: 'confirmDestination',
      desc: '',
      args: [],
    );
  }

  /// `Your offer`
  String get yourOffer {
    return Intl.message('Your offer', name: 'yourOffer', desc: '', args: []);
  }

  /// `Saved cards`
  String get savedCards {
    return Intl.message('Saved cards', name: 'savedCards', desc: '', args: []);
  }

  /// `Add new card`
  String get addNewCard {
    return Intl.message('Add new card', name: 'addNewCard', desc: '', args: []);
  }

  /// `Review`
  String get review {
    return Intl.message('Review', name: 'review', desc: '', args: []);
  }

  /// `Rate your experience`
  String get rateYourExperience {
    return Intl.message(
      'Rate your experience',
      name: 'rateYourExperience',
      desc: '',
      args: [],
    );
  }

  /// `Write your review`
  String get writeYourReview {
    return Intl.message(
      'Write your review',
      name: 'writeYourReview',
      desc: '',
      args: [],
    );
  }

  /// `Comfortable car`
  String get comfortableCar {
    return Intl.message(
      'Comfortable car',
      name: 'comfortableCar',
      desc: '',
      args: [],
    );
  }

  /// `Clean car`
  String get cleanCar {
    return Intl.message('Clean car', name: 'cleanCar', desc: '', args: []);
  }

  /// `Safe driving`
  String get safeDriving {
    return Intl.message(
      'Safe driving',
      name: 'safeDriving',
      desc: '',
      args: [],
    );
  }

  /// `Polite driver`
  String get politeDriver {
    return Intl.message(
      'Polite driver',
      name: 'politeDriver',
      desc: '',
      args: [],
    );
  }

  /// `On time`
  String get onTime {
    return Intl.message('On time', name: 'onTime', desc: '', args: []);
  }

  /// `Good music`
  String get goodMusic {
    return Intl.message('Good music', name: 'goodMusic', desc: '', args: []);
  }

  /// `AC on`
  String get acOn {
    return Intl.message('AC on', name: 'acOn', desc: '', args: []);
  }

  /// `Polite passenger`
  String get politePassenger {
    return Intl.message(
      'Polite passenger',
      name: 'politePassenger',
      desc: '',
      args: [],
    );
  }

  /// `Waiting on time`
  String get waitingOnTime {
    return Intl.message(
      'Waiting on time',
      name: 'waitingOnTime',
      desc: '',
      args: [],
    );
  }

  /// `Quiet passenger`
  String get quietPassenger {
    return Intl.message(
      'Quiet passenger',
      name: 'quietPassenger',
      desc: '',
      args: [],
    );
  }

  /// `Clean passenger`
  String get cleanPassenger {
    return Intl.message(
      'Clean passenger',
      name: 'cleanPassenger',
      desc: '',
      args: [],
    );
  }

  /// `Respectful`
  String get respectful {
    return Intl.message('Respectful', name: 'respectful', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Referral code`
  String get referralCode {
    return Intl.message(
      'Referral code',
      name: 'referralCode',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Distance Alert`
  String get warning {
    return Intl.message('Distance Alert', name: 'warning', desc: '', args: []);
  }

  /// `The distance exceeds 100 km. Do you want to proceed as an outstation ride?`
  String get longDistanceMessage {
    return Intl.message(
      'The distance exceeds 100 km. Do you want to proceed as an outstation ride?',
      name: 'longDistanceMessage',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Select Address`
  String get selectAddress {
    return Intl.message(
      'Select Address',
      name: 'selectAddress',
      desc: '',
      args: [],
    );
  }

  /// `National ID images stored successfully`
  String get nationalIdStored {
    return Intl.message(
      'National ID images stored successfully',
      name: 'nationalIdStored',
      desc: '',
      args: [],
    );
  }

  /// `Licence images stored successfully`
  String get licenceStored {
    return Intl.message(
      'Licence images stored successfully',
      name: 'licenceStored',
      desc: '',
      args: [],
    );
  }

  /// `Criminal record image stored successfully`
  String get criminalRecordStored {
    return Intl.message(
      'Criminal record image stored successfully',
      name: 'criminalRecordStored',
      desc: '',
      args: [],
    );
  }

  /// `Car information stored successfully`
  String get carInfoStored {
    return Intl.message(
      'Car information stored successfully',
      name: 'carInfoStored',
      desc: '',
      args: [],
    );
  }

  /// `Car licence images stored successfully`
  String get carLicenceStored {
    return Intl.message(
      'Car licence images stored successfully',
      name: 'carLicenceStored',
      desc: '',
      args: [],
    );
  }

  /// `Please select an image`
  String get pleaseSelectImage {
    return Intl.message(
      'Please select an image',
      name: 'pleaseSelectImage',
      desc: '',
      args: [],
    );
  }

  /// `Red`
  String get red {
    return Intl.message('Red', name: 'red', desc: '', args: []);
  }

  /// `Invalid number`
  String get invalidNumber {
    return Intl.message(
      'Invalid number',
      name: 'invalidNumber',
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

  /// `Description is required`
  String get descriptionRequired {
    return Intl.message(
      'Description is required',
      name: 'descriptionRequired',
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

  /// `Building number is required`
  String get buildingRequired {
    return Intl.message(
      'Building number is required',
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

  /// `Apartment number is required`
  String get apartmentRequired {
    return Intl.message(
      'Apartment number is required',
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

  /// `Invalid national ID`
  String get invalidNationalId {
    return Intl.message(
      'Invalid national ID',
      name: 'invalidNationalId',
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

  /// `Date of birth is required`
  String get dobRequired {
    return Intl.message(
      'Date of birth is required',
      name: 'dobRequired',
      desc: '',
      args: [],
    );
  }

  /// `Update profile`
  String get updateProfile {
    return Intl.message(
      'Update profile',
      name: 'updateProfile',
      desc: '',
      args: [],
    );
  }

  /// `Profile updated successfully`
  String get profileUpdatedSuccessfully {
    return Intl.message(
      'Profile updated successfully',
      name: 'profileUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Read FAQs solutions`
  String get readFaqsSolution {
    return Intl.message(
      'Read FAQs solutions',
      name: 'readFaqsSolution',
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

  /// `Card number`
  String get cardNumber {
    return Intl.message('Card number', name: 'cardNumber', desc: '', args: []);
  }

  /// `Holder name`
  String get holderName {
    return Intl.message('Holder name', name: 'holderName', desc: '', args: []);
  }

  /// `Expiry date`
  String get expiryDate {
    return Intl.message('Expiry date', name: 'expiryDate', desc: '', args: []);
  }

  /// `CVV`
  String get cvv {
    return Intl.message('CVV', name: 'cvv', desc: '', args: []);
  }

  /// `No data`
  String get noData {
    return Intl.message('No data', name: 'noData', desc: '', args: []);
  }

  /// `Pay`
  String get pay {
    return Intl.message('Pay', name: 'pay', desc: '', args: []);
  }

  /// `Accept`
  String get accept {
    return Intl.message('Accept', name: 'accept', desc: '', args: []);
  }

  /// `Reject`
  String get reject {
    return Intl.message('Reject', name: 'reject', desc: '', args: []);
  }

  /// `Searching...`
  String get searching {
    return Intl.message('Searching...', name: 'searching', desc: '', args: []);
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

  /// `EGP `
  String get egpPrefix {
    return Intl.message('EGP ', name: 'egpPrefix', desc: '', args: []);
  }

  /// `Promo code`
  String get promoCode {
    return Intl.message('Promo code', name: 'promoCode', desc: '', args: []);
  }

  /// `Are you sure you want to logout?`
  String get logoutConfirmation {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'logoutConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `You have been logged out successfully`
  String get logoutSuccessMessage {
    return Intl.message(
      'You have been logged out successfully',
      name: 'logoutSuccessMessage',
      desc: '',
      args: [],
    );
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

  /// `Invalid phone number`
  String get invalidPhone {
    return Intl.message(
      'Invalid phone number',
      name: 'invalidPhone',
      desc: '',
      args: [],
    );
  }

  /// `Valid phone number`
  String get validPhone {
    return Intl.message(
      'Valid phone number',
      name: 'validPhone',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal requests`
  String get withdrawalRequests {
    return Intl.message(
      'Withdrawal requests',
      name: 'withdrawalRequests',
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

  /// `Registration Under Review`
  String get registrationPending {
    return Intl.message(
      'Registration Under Review',
      name: 'registrationPending',
      desc: '',
      args: [],
    );
  }

  /// `Your documents have been submitted successfully. They will be reviewed by the administration within 24 hours.`
  String get registrationPendingDescription {
    return Intl.message(
      'Your documents have been submitted successfully. They will be reviewed by the administration within 24 hours.',
      name: 'registrationPendingDescription',
      desc: '',
      args: [],
    );
  }

  /// `Go to Home`
  String get goHome {
    return Intl.message('Go to Home', name: 'goHome', desc: '', args: []);
  }

  /// `Trip Summary`
  String get tripSummary {
    return Intl.message(
      'Trip Summary',
      name: 'tripSummary',
      desc: '',
      args: [],
    );
  }

  /// `Trip Details`
  String get tripDetails {
    return Intl.message(
      'Trip Details',
      name: 'tripDetails',
      desc: '',
      args: [],
    );
  }

  /// `Total Price`
  String get totalPrice {
    return Intl.message('Total Price', name: 'totalPrice', desc: '', args: []);
  }

  /// `Driver Details`
  String get driverDetails {
    return Intl.message(
      'Driver Details',
      name: 'driverDetails',
      desc: '',
      args: [],
    );
  }

  /// `Add Review`
  String get addReview {
    return Intl.message('Add Review', name: 'addReview', desc: '', args: []);
  }

  /// `Select date/time`
  String get selectDate {
    return Intl.message(
      'Select date/time',
      name: 'selectDate',
      desc: '',
      args: [],
    );
  }

  /// `Saved places`
  String get savedPlaces {
    return Intl.message(
      'Saved places',
      name: 'savedPlaces',
      desc: '',
      args: [],
    );
  }

  /// `Add new place`
  String get addNewPlace {
    return Intl.message(
      'Add new place',
      name: 'addNewPlace',
      desc: '',
      args: [],
    );
  }

  /// `Place name`
  String get placeName {
    return Intl.message('Place name', name: 'placeName', desc: '', args: []);
  }

  /// `Please select a location first`
  String get selectLocationFirst {
    return Intl.message(
      'Please select a location first',
      name: 'selectLocationFirst',
      desc: '',
      args: [],
    );
  }

  /// `E.g. Home, Work`
  String get egHomeWork {
    return Intl.message(
      'E.g. Home, Work',
      name: 'egHomeWork',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Work`
  String get work {
    return Intl.message('Work', name: 'work', desc: '', args: []);
  }

  /// `School`
  String get school {
    return Intl.message('School', name: 'school', desc: '', args: []);
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `No notifications yet`
  String get noNotificationsYet {
    return Intl.message(
      'No notifications yet',
      name: 'noNotificationsYet',
      desc: '',
      args: [],
    );
  }

  /// `Women Only`
  String get womenOnly {
    return Intl.message('Women Only', name: 'womenOnly', desc: '', args: []);
  }

  /// `Other`
  String get other {
    return Intl.message('Other', name: 'other', desc: '', args: []);
  }

  /// `Arrived`
  String get arrived {
    return Intl.message('Arrived', name: 'arrived', desc: '', args: []);
  }

  /// `Start Trip`
  String get startTrip {
    return Intl.message('Start Trip', name: 'startTrip', desc: '', args: []);
  }

  /// `End Trip`
  String get endTrip {
    return Intl.message('End Trip', name: 'endTrip', desc: '', args: []);
  }

  /// `Navigate`
  String get navigate {
    return Intl.message('Navigate', name: 'navigate', desc: '', args: []);
  }

  /// `Earnings`
  String get earnings {
    return Intl.message('Earnings', name: 'earnings', desc: '', args: []);
  }

  /// `Total Earnings`
  String get totalEarnings {
    return Intl.message(
      'Total Earnings',
      name: 'totalEarnings',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message('Today', name: 'today', desc: '', args: []);
  }

  /// `This Week`
  String get thisWeek {
    return Intl.message('This Week', name: 'thisWeek', desc: '', args: []);
  }

  /// `This Month`
  String get thisMonth {
    return Intl.message('This Month', name: 'thisMonth', desc: '', args: []);
  }

  /// `Trips`
  String get trips {
    return Intl.message('Trips', name: 'trips', desc: '', args: []);
  }

  /// `Ride Requests`
  String get rideRequests {
    return Intl.message(
      'Ride Requests',
      name: 'rideRequests',
      desc: '',
      args: [],
    );
  }

  /// `Cargo & Delivery`
  String get cargoDelivery {
    return Intl.message(
      'Cargo & Delivery',
      name: 'cargoDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Available Orders`
  String get availableOrders {
    return Intl.message(
      'Available Orders',
      name: 'availableOrders',
      desc: '',
      args: [],
    );
  }

  /// `Driver: `
  String get driverLabel {
    return Intl.message('Driver: ', name: 'driverLabel', desc: '', args: []);
  }

  /// `Price: `
  String get priceLabel {
    return Intl.message('Price: ', name: 'priceLabel', desc: '', args: []);
  }

  /// `s`
  String get secondsSuffix {
    return Intl.message('s', name: 'secondsSuffix', desc: '', args: []);
  }

  /// `Message`
  String get message {
    return Intl.message('Message', name: 'message', desc: '', args: []);
  }

  /// `Use Map`
  String get useMap {
    return Intl.message('Use Map', name: 'useMap', desc: '', args: []);
  }

  /// `Confirm Trip`
  String get confirmTrip {
    return Intl.message(
      'Confirm Trip',
      name: 'confirmTrip',
      desc: '',
      args: [],
    );
  }

  /// `Please select all car details`
  String get pleaseSelectAllCarDetails {
    return Intl.message(
      'Please select all car details',
      name: 'pleaseSelectAllCarDetails',
      desc: '',
      args: [],
    );
  }

  /// `Error: {error}`
  String errorOccurredWith(Object error) {
    return Intl.message(
      'Error: $error',
      name: 'errorOccurredWith',
      desc: '',
      args: [error],
    );
  }

  /// `Please select`
  String get pleaseSelect {
    return Intl.message(
      'Please select',
      name: 'pleaseSelect',
      desc: '',
      args: [],
    );
  }

  /// `Add photo`
  String get addPhoto {
    return Intl.message('Add photo', name: 'addPhoto', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Write your comment here...`
  String get writeComment {
    return Intl.message(
      'Write your comment here...',
      name: 'writeComment',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message('Camera', name: 'camera', desc: '', args: []);
  }

  /// `Gallery`
  String get gallery {
    return Intl.message('Gallery', name: 'gallery', desc: '', args: []);
  }

  /// `Loading brands...`
  String get loadingBrands {
    return Intl.message(
      'Loading brands...',
      name: 'loadingBrands',
      desc: '',
      args: [],
    );
  }

  /// `Loading models...`
  String get loadingModels {
    return Intl.message(
      'Loading models...',
      name: 'loadingModels',
      desc: '',
      args: [],
    );
  }

  /// `Loading models...`
  String get loadingModel {
    return Intl.message(
      'Loading models...',
      name: 'loadingModel',
      desc: '',
      args: [],
    );
  }

  /// `Select brand first`
  String get selectBrandFirst {
    return Intl.message(
      'Select brand first',
      name: 'selectBrandFirst',
      desc: '',
      args: [],
    );
  }

  /// `{distance} KM`
  String kmSuffix(Object distance) {
    return Intl.message(
      '$distance KM',
      name: 'kmSuffix',
      desc: '',
      args: [distance],
    );
  }

  /// `{minutes} min`
  String minSuffix(Object minutes) {
    return Intl.message(
      '$minutes min',
      name: 'minSuffix',
      desc: '',
      args: [minutes],
    );
  }

  /// `{weight} KG`
  String kgSuffix(Object weight) {
    return Intl.message(
      '$weight KG',
      name: 'kgSuffix',
      desc: '',
      args: [weight],
    );
  }

  /// `+ {amount} {currency}`
  String biddingAmount(Object amount, Object currency) {
    return Intl.message(
      '+ $amount $currency',
      name: 'biddingAmount',
      desc: '',
      args: [amount, currency],
    );
  }

  /// `Accept Ride ({price} {currency})`
  String acceptRideWithPrice(Object price, Object currency) {
    return Intl.message(
      'Accept Ride ($price $currency)',
      name: 'acceptRideWithPrice',
      desc: '',
      args: [price, currency],
    );
  }

  /// `Searching`
  String get statusSearching {
    return Intl.message(
      'Searching',
      name: 'statusSearching',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get statusCompleted {
    return Intl.message(
      'Completed',
      name: 'statusCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Continue Trip`
  String get continueTrip {
    return Intl.message(
      'Continue Trip',
      name: 'continueTrip',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Trip`
  String get cancelTrip {
    return Intl.message('Cancel Trip', name: 'cancelTrip', desc: '', args: []);
  }

  /// `Canceled`
  String get statusCanceled {
    return Intl.message('Canceled', name: 'statusCanceled', desc: '', args: []);
  }

  /// `Started`
  String get statusStarted {
    return Intl.message('Started', name: 'statusStarted', desc: '', args: []);
  }

  /// `Accepted`
  String get statusAccepted {
    return Intl.message('Accepted', name: 'statusAccepted', desc: '', args: []);
  }

  /// `Placed`
  String get statusPlaced {
    return Intl.message('Placed', name: 'statusPlaced', desc: '', args: []);
  }

  /// `Choose Your Destination`
  String get chooseDestination {
    return Intl.message(
      'Choose Your Destination',
      name: 'chooseDestination',
      desc: '',
      args: [],
    );
  }

  /// `Driver Offer {number}`
  String driverOfferWithNumber(Object number) {
    return Intl.message(
      'Driver Offer $number',
      name: 'driverOfferWithNumber',
      desc: '',
      args: [number],
    );
  }

  /// `Recent Earnings`
  String get recentEarnings {
    return Intl.message(
      'Recent Earnings',
      name: 'recentEarnings',
      desc: '',
      args: [],
    );
  }

  /// `Trip Date: {date}`
  String tripDate(Object date) {
    return Intl.message(
      'Trip Date: $date',
      name: 'tripDate',
      desc: '',
      args: [date],
    );
  }

  /// `Refresh`
  String get refresh {
    return Intl.message('Refresh', name: 'refresh', desc: '', args: []);
  }

  /// `Developer Tools`
  String get developerTools {
    return Intl.message(
      'Developer Tools',
      name: 'developerTools',
      desc: '',
      args: [],
    );
  }

  /// `Reset Location`
  String get resetLocation {
    return Intl.message(
      'Reset Location',
      name: 'resetLocation',
      desc: '',
      args: [],
    );
  }

  /// `Clear Cache`
  String get clearCache {
    return Intl.message('Clear Cache', name: 'clearCache', desc: '', args: []);
  }

  /// `Test Notification`
  String get testNotification {
    return Intl.message(
      'Test Notification',
      name: 'testNotification',
      desc: '',
      args: [],
    );
  }

  /// `Toggle Driver Mode`
  String get toggleDriverMode {
    return Intl.message(
      'Toggle Driver Mode',
      name: 'toggleDriverMode',
      desc: '',
      args: [],
    );
  }

  /// `User Home`
  String get userHome {
    return Intl.message('User Home', name: 'userHome', desc: '', args: []);
  }

  /// `Driver Home (Map)`
  String get driverHomeMap {
    return Intl.message(
      'Driver Home (Map)',
      name: 'driverHomeMap',
      desc: '',
      args: [],
    );
  }

  /// `Earnings Dashboard`
  String get earningsDashboard {
    return Intl.message(
      'Earnings Dashboard',
      name: 'earningsDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Unified Rides History`
  String get unifiedRidesHistory {
    return Intl.message(
      'Unified Rides History',
      name: 'unifiedRidesHistory',
      desc: '',
      args: [],
    );
  }

  /// `Notification Center`
  String get notificationCenter {
    return Intl.message(
      'Notification Center',
      name: 'notificationCenter',
      desc: '',
      args: [],
    );
  }

  /// `Navigation Shortcuts`
  String get navigationShortcuts {
    return Intl.message(
      'Navigation Shortcuts',
      name: 'navigationShortcuts',
      desc: '',
      args: [],
    );
  }

  /// `Toggle Role Data`
  String get toggleRoleData {
    return Intl.message(
      'Toggle Role Data',
      name: 'toggleRoleData',
      desc: '',
      args: [],
    );
  }

  /// `Current Role:`
  String get currentRole {
    return Intl.message(
      'Current Role:',
      name: 'currentRole',
      desc: '',
      args: [],
    );
  }

  /// `Auth Token:`
  String get authToken {
    return Intl.message('Auth Token:', name: 'authToken', desc: '', args: []);
  }

  /// `Switched to {role} data mode`
  String switchedTo(Object role) {
    return Intl.message(
      'Switched to $role data mode',
      name: 'switchedTo',
      desc: '',
      args: [role],
    );
  }

  /// `Transaction History`
  String get transactionHistory {
    return Intl.message(
      'Transaction History',
      name: 'transactionHistory',
      desc: '',
      args: [],
    );
  }

  /// `{hours} h`
  String hoursSuffix(Object hours) {
    return Intl.message(
      '$hours h',
      name: 'hoursSuffix',
      desc: '',
      args: [hours],
    );
  }

  /// `Driver A`
  String get driverA {
    return Intl.message('Driver A', name: 'driverA', desc: '', args: []);
  }

  /// `Driver B`
  String get driverB {
    return Intl.message('Driver B', name: 'driverB', desc: '', args: []);
  }

  /// `Driver C`
  String get driverC {
    return Intl.message('Driver C', name: 'driverC', desc: '', args: []);
  }

  /// `Waiting for replies...`
  String get waitingForReplies {
    return Intl.message(
      'Waiting for replies...',
      name: 'waitingForReplies',
      desc: '',
      args: [],
    );
  }

  /// `Raise Fare`
  String get raiseFare {
    return Intl.message('Raise Fare', name: 'raiseFare', desc: '', args: []);
  }

  /// `Find Driver`
  String get findDriver {
    return Intl.message('Find Driver', name: 'findDriver', desc: '', args: []);
  }

  /// `Auto Accept (original price)`
  String get autoAccept {
    return Intl.message(
      'Auto Accept (original price)',
      name: 'autoAccept',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Location`
  String get unknownLocation {
    return Intl.message(
      'Unknown Location',
      name: 'unknownLocation',
      desc: '',
      args: [],
    );
  }

  /// `away from you`
  String get awayFromYou {
    return Intl.message(
      'away from you',
      name: 'awayFromYou',
      desc: '',
      args: [],
    );
  }

  /// `Help Center`
  String get help {
    return Intl.message('Help Center', name: 'help', desc: '', args: []);
  }

  /// `Get help with a trip`
  String get getHelpWithTrip {
    return Intl.message(
      'Get help with a trip',
      name: 'getHelpWithTrip',
      desc: '',
      args: [],
    );
  }

  /// `Recent Rides`
  String get recentRides {
    return Intl.message(
      'Recent Rides',
      name: 'recentRides',
      desc: '',
      args: [],
    );
  }

  /// `Report an issue with a recent trip`
  String get reportIssueRecentTrip {
    return Intl.message(
      'Report an issue with a recent trip',
      name: 'reportIssueRecentTrip',
      desc: '',
      args: [],
    );
  }

  /// `Help Categories`
  String get helpCategories {
    return Intl.message(
      'Help Categories',
      name: 'helpCategories',
      desc: '',
      args: [],
    );
  }

  /// `Account Support`
  String get accountSupport {
    return Intl.message(
      'Account Support',
      name: 'accountSupport',
      desc: '',
      args: [],
    );
  }

  /// `Payment & Pricing`
  String get paymentSupport {
    return Intl.message(
      'Payment & Pricing',
      name: 'paymentSupport',
      desc: '',
      args: [],
    );
  }

  /// `Safety Center`
  String get safetyCenter {
    return Intl.message(
      'Safety Center',
      name: 'safetyCenter',
      desc: '',
      args: [],
    );
  }

  /// `App Guide`
  String get appGuide {
    return Intl.message('App Guide', name: 'appGuide', desc: '', args: []);
  }

  /// `Still need help?`
  String get stillNeedHelp {
    return Intl.message(
      'Still need help?',
      name: 'stillNeedHelp',
      desc: '',
      args: [],
    );
  }

  /// `Live Chat`
  String get liveChat {
    return Intl.message('Live Chat', name: 'liveChat', desc: '', args: []);
  }

  /// `Chat with our support team`
  String get chatWithSupport {
    return Intl.message(
      'Chat with our support team',
      name: 'chatWithSupport',
      desc: '',
      args: [],
    );
  }

  /// `User not found`
  String get userNotFound {
    return Intl.message(
      'User not found',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Code is incorrect`
  String get codeNotCorrect {
    return Intl.message(
      'Code is incorrect',
      name: 'codeNotCorrect',
      desc: '',
      args: [],
    );
  }

  /// `Call our support team`
  String get callSupportTeam {
    return Intl.message(
      'Call our support team',
      name: 'callSupportTeam',
      desc: '',
      args: [],
    );
  }

  /// `Send us an email`
  String get sendSupportEmail {
    return Intl.message(
      'Send us an email',
      name: 'sendSupportEmail',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get personalInformation {
    return Intl.message(
      'Personal Information',
      name: 'personalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Licences & Documents`
  String get licencesAndDocuments {
    return Intl.message(
      'Licences & Documents',
      name: 'licencesAndDocuments',
      desc: '',
      args: [],
    );
  }

  /// `Registration Progress`
  String get registrationProgress {
    return Intl.message(
      'Registration Progress',
      name: 'registrationProgress',
      desc: '',
      args: [],
    );
  }

  /// `All steps completed!`
  String get allStepsCompleted {
    return Intl.message(
      'All steps completed!',
      name: 'allStepsCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Complete steps to become a driver`
  String get completeStepsToBecomeDriver {
    return Intl.message(
      'Complete steps to become a driver',
      name: 'completeStepsToBecomeDriver',
      desc: '',
      args: [],
    );
  }

  /// `Submitting...`
  String get submitting {
    return Intl.message(
      'Submitting...',
      name: 'submitting',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get services {
    return Intl.message('Services', name: 'services', desc: '', args: []);
  }

  /// `Account & Wallet`
  String get accountAndWallet {
    return Intl.message(
      'Account & Wallet',
      name: 'accountAndWallet',
      desc: '',
      args: [],
    );
  }

  /// `Work With Us`
  String get workWithUs {
    return Intl.message('Work With Us', name: 'workWithUs', desc: '', args: []);
  }

  /// `Driver Services`
  String get driverServices {
    return Intl.message(
      'Driver Services',
      name: 'driverServices',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle & Registration`
  String get vehicleAndRegistration {
    return Intl.message(
      'Vehicle & Registration',
      name: 'vehicleAndRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account?`
  String get deleteAccountWarningTitle {
    return Intl.message(
      'Are you sure you want to delete your account?',
      name: 'deleteAccountWarningTitle',
      desc: '',
      args: [],
    );
  }

  /// `This action is permanent and cannot be undone. All your data, including ride history and wallet balance, will be lost.`
  String get deleteAccountWarningMessage {
    return Intl.message(
      'This action is permanent and cannot be undone. All your data, including ride history and wallet balance, will be lost.',
      name: 'deleteAccountWarningMessage',
      desc: '',
      args: [],
    );
  }

  /// `Permanently delete my account`
  String get permanentlyDelete {
    return Intl.message(
      'Permanently delete my account',
      name: 'permanentlyDelete',
      desc: '',
      args: [],
    );
  }

  /// `Connection Restored`
  String get connectionRestored {
    return Intl.message(
      'Connection Restored',
      name: 'connectionRestored',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get noInternetConnection {
    return Intl.message(
      'No Internet Connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Message sent successfully`
  String get messageSentSuccessfully {
    return Intl.message(
      'Message sent successfully',
      name: 'messageSentSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Type your message here...`
  String get typeMessageHere {
    return Intl.message(
      'Type your message here...',
      name: 'typeMessageHere',
      desc: '',
      args: [],
    );
  }

  /// `The deducted amount will be automatically added to your wallet`
  String get deductedAmountAddedToWallet {
    return Intl.message(
      'The deducted amount will be automatically added to your wallet',
      name: 'deductedAmountAddedToWallet',
      desc: '',
      args: [],
    );
  }

  /// `Processing your payment...`
  String get processingPayment {
    return Intl.message(
      'Processing your payment...',
      name: 'processingPayment',
      desc: '',
      args: [],
    );
  }

  /// `Payment Failed`
  String get paymentFailed {
    return Intl.message(
      'Payment Failed',
      name: 'paymentFailed',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong with your payment. Please check your card or try another method.`
  String get paymentFailedMsg {
    return Intl.message(
      'Something went wrong with your payment. Please check your card or try another method.',
      name: 'paymentFailedMsg',
      desc: '',
      args: [],
    );
  }

  /// `Driver has arrived at your location`
  String get driverArrived {
    return Intl.message(
      'Driver has arrived at your location',
      name: 'driverArrived',
      desc: '',
      args: [],
    );
  }

  /// `Trip in progress`
  String get tripInProgress {
    return Intl.message(
      'Trip in progress',
      name: 'tripInProgress',
      desc: '',
      args: [],
    );
  }

  /// `Driver is on the way`
  String get driverOnWay {
    return Intl.message(
      'Driver is on the way',
      name: 'driverOnWay',
      desc: '',
      args: [],
    );
  }

  /// `Change Payment Method`
  String get changePaymentMethod {
    return Intl.message(
      'Change Payment Method',
      name: 'changePaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Arriving in`
  String get arrivingIn {
    return Intl.message('Arriving in', name: 'arrivingIn', desc: '', args: []);
  }

  /// `Offer Accepted!`
  String get offerAcceptedTitle {
    return Intl.message(
      'Offer Accepted!',
      name: 'offerAcceptedTitle',
      desc: '',
      args: [],
    );
  }

  /// `We're now securing your ride and preparing for payment.`
  String get offerAcceptedSub {
    return Intl.message(
      'We\'re now securing your ride and preparing for payment.',
      name: 'offerAcceptedSub',
      desc: '',
      args: [],
    );
  }

  /// `Initiating secure payment...`
  String get paymentInitiated {
    return Intl.message(
      'Initiating secure payment...',
      name: 'paymentInitiated',
      desc: '',
      args: [],
    );
  }

  /// `Waiting for bank confirmation... this usually takes 10-30 seconds.`
  String get bankConfirmation {
    return Intl.message(
      'Waiting for bank confirmation... this usually takes 10-30 seconds.',
      name: 'bankConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Finalizing your booking... almost ready!`
  String get finalizingBooking {
    return Intl.message(
      'Finalizing your booking... almost ready!',
      name: 'finalizingBooking',
      desc: '',
      args: [],
    );
  }

  /// `Driver is starting the engine and heading to your location.`
  String get driverHeadingToYou {
    return Intl.message(
      'Driver is starting the engine and heading to your location.',
      name: 'driverHeadingToYou',
      desc: '',
      args: [],
    );
  }

  /// `Your driver has arrived at the pickup point.`
  String get arrivedDescription {
    return Intl.message(
      'Your driver has arrived at the pickup point.',
      name: 'arrivedDescription',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy your ride! Heading to your destination.`
  String get onTripDescription {
    return Intl.message(
      'Enjoy your ride! Heading to your destination.',
      name: 'onTripDescription',
      desc: '',
      args: [],
    );
  }

  /// `Accepted`
  String get stepAccepted {
    return Intl.message('Accepted', name: 'stepAccepted', desc: '', args: []);
  }

  /// `Payment`
  String get stepPayment {
    return Intl.message('Payment', name: 'stepPayment', desc: '', args: []);
  }

  /// `On Way`
  String get stepOnWay {
    return Intl.message('On Way', name: 'stepOnWay', desc: '', args: []);
  }

  /// `Arrived`
  String get stepArrived {
    return Intl.message('Arrived', name: 'stepArrived', desc: '', args: []);
  }

  /// `Started`
  String get stepStarted {
    return Intl.message('Started', name: 'stepStarted', desc: '', args: []);
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `Are you sure you want to cancel the ride?`
  String get cancelConfirmation {
    return Intl.message(
      'Are you sure you want to cancel the ride?',
      name: 'cancelConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `No fees will be charged if you cancel now.`
  String get cancelWarning {
    return Intl.message(
      'No fees will be charged if you cancel now.',
      name: 'cancelWarning',
      desc: '',
      args: [],
    );
  }

  /// `Hide`
  String get hideDetails {
    return Intl.message('Hide', name: 'hideDetails', desc: '', args: []);
  }

  /// `Details`
  String get showDetails {
    return Intl.message('Details', name: 'showDetails', desc: '', args: []);
  }

  /// `Searching for drivers...`
  String get searchingDrivers {
    return Intl.message(
      'Searching for drivers...',
      name: 'searchingDrivers',
      desc: '',
      args: [],
    );
  }

  /// `Sending your request...`
  String get sendingRequest {
    return Intl.message(
      'Sending your request...',
      name: 'sendingRequest',
      desc: '',
      args: [],
    );
  }

  /// `Finding the best offers...`
  String get findingBestOffers {
    return Intl.message(
      'Finding the best offers...',
      name: 'findingBestOffers',
      desc: '',
      args: [],
    );
  }

  /// `Just a moment please...`
  String get momentPlease {
    return Intl.message(
      'Just a moment please...',
      name: 'momentPlease',
      desc: '',
      args: [],
    );
  }

  /// `Connecting with nearby drivers...`
  String get connectingWithDrivers {
    return Intl.message(
      'Connecting with nearby drivers...',
      name: 'connectingWithDrivers',
      desc: '',
      args: [],
    );
  }

  /// `Offers will appear here shortly. Please wait.`
  String get offersWillAppearHere {
    return Intl.message(
      'Offers will appear here shortly. Please wait.',
      name: 'offersWillAppearHere',
      desc: '',
      args: [],
    );
  }

  /// `Net Earnings`
  String get netEarnings {
    return Intl.message(
      'Net Earnings',
      name: 'netEarnings',
      desc: '',
      args: [],
    );
  }

  /// `Gross Earnings`
  String get grossEarnings {
    return Intl.message(
      'Gross Earnings',
      name: 'grossEarnings',
      desc: '',
      args: [],
    );
  }

  /// `Commission`
  String get commission {
    return Intl.message('Commission', name: 'commission', desc: '', args: []);
  }

  /// `Cash Collected`
  String get cashCollected {
    return Intl.message(
      'Cash Collected',
      name: 'cashCollected',
      desc: '',
      args: [],
    );
  }

  /// `Digital Earnings`
  String get digitalEarnings {
    return Intl.message(
      'Digital Earnings',
      name: 'digitalEarnings',
      desc: '',
      args: [],
    );
  }

  /// `Performance`
  String get performance {
    return Intl.message('Performance', name: 'performance', desc: '', args: []);
  }

  /// `No trips yet`
  String get noTripsYet {
    return Intl.message('No trips yet', name: 'noTripsYet', desc: '', args: []);
  }

  /// `Reward Points`
  String get rewardPoints {
    return Intl.message(
      'Reward Points',
      name: 'rewardPoints',
      desc: '',
      args: [],
    );
  }

  /// `Your Current Points`
  String get yourPoints {
    return Intl.message(
      'Your Current Points',
      name: 'yourPoints',
      desc: '',
      args: [],
    );
  }

  /// `{points} Points`
  String pointsSuffix(Object points) {
    return Intl.message(
      '$points Points',
      name: 'pointsSuffix',
      desc: '',
      args: [points],
    );
  }

  /// `Cancellation Penalty`
  String get cancelPenalty {
    return Intl.message(
      'Cancellation Penalty',
      name: 'cancelPenalty',
      desc: '',
      args: [],
    );
  }

  /// `Points History`
  String get pointsHistory {
    return Intl.message(
      'Points History',
      name: 'pointsHistory',
      desc: '',
      args: [],
    );
  }

  /// `Points Added`
  String get pointsAdded {
    return Intl.message(
      'Points Added',
      name: 'pointsAdded',
      desc: '',
      args: [],
    );
  }

  /// `Points Deducted`
  String get pointsDeducted {
    return Intl.message(
      'Points Deducted',
      name: 'pointsDeducted',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations!`
  String get congratulations {
    return Intl.message(
      'Congratulations!',
      name: 'congratulations',
      desc: '',
      args: [],
    );
  }

  /// `You have earned {points} points for your last trip.`
  String youEarnedPoints(Object points) {
    return Intl.message(
      'You have earned $points points for your last trip.',
      name: 'youEarnedPoints',
      desc: '',
      args: [points],
    );
  }

  /// `You have been penalized {points} points for canceling the trip.`
  String penaltyDeducted(Object points) {
    return Intl.message(
      'You have been penalized $points points for canceling the trip.',
      name: 'penaltyDeducted',
      desc: '',
      args: [points],
    );
  }

  /// `Packages Store`
  String get packagesStore {
    return Intl.message(
      'Packages Store',
      name: 'packagesStore',
      desc: '',
      args: [],
    );
  }

  /// `No packages available currently`
  String get noPackagesAvailable {
    return Intl.message(
      'No packages available currently',
      name: 'noPackagesAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Your Current Points`
  String get yourCurrentPoints {
    return Intl.message(
      'Your Current Points',
      name: 'yourCurrentPoints',
      desc: '',
      args: [],
    );
  }

  /// `Point`
  String get point {
    return Intl.message('Point', name: 'point', desc: '', args: []);
  }

  /// `You are already subscribed to a package`
  String get alreadySubscribedToPackage {
    return Intl.message(
      'You are already subscribed to a package',
      name: 'alreadySubscribedToPackage',
      desc: '',
      args: [],
    );
  }

  /// `Current Package`
  String get currentPackage {
    return Intl.message(
      'Current Package',
      name: 'currentPackage',
      desc: '',
      args: [],
    );
  }

  /// `Expiration Date`
  String get expirationDate {
    return Intl.message(
      'Expiration Date',
      name: 'expirationDate',
      desc: '',
      args: [],
    );
  }

  /// `Valid for`
  String get validFor {
    return Intl.message('Valid for', name: 'validFor', desc: '', args: []);
  }

  /// `Days`
  String get days {
    return Intl.message('Days', name: 'days', desc: '', args: []);
  }

  /// `Confirm Purchase`
  String get confirmPurchase {
    return Intl.message(
      'Confirm Purchase',
      name: 'confirmPurchase',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to purchase the package using {method}?`
  String confirmPackagePurchaseMethod(Object method) {
    return Intl.message(
      'Are you sure you want to purchase the package using $method?',
      name: 'confirmPackagePurchaseMethod',
      desc: '',
      args: [method],
    );
  }

  /// `Points`
  String get pointsMethod {
    return Intl.message('Points', name: 'pointsMethod', desc: '', args: []);
  }

  /// `Wallet`
  String get walletMethod {
    return Intl.message('Wallet', name: 'walletMethod', desc: '', args: []);
  }

  /// `Driver Store`
  String get driverStore {
    return Intl.message(
      'Driver Store',
      name: 'driverStore',
      desc: '',
      args: [],
    );
  }

  /// `Discount Percentage`
  String get discountPercentage {
    return Intl.message(
      'Discount Percentage',
      name: 'discountPercentage',
      desc: '',
      args: [],
    );
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
