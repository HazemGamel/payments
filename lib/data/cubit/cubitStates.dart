
abstract class PaymentState{}

class paymentinitalstate extends PaymentState{}

class paymentInitStatSuccess extends PaymentState{}
class paymentInitStatError extends PaymentState{
  String error;
  paymentInitStatError(this.error);
}

class paymentfirestTokenSuccess extends PaymentState{}
class paymentfirestTokenError extends PaymentState{
  String error;
  paymentfirestTokenError(this.error);
}

class paymentOrderIdSuccess extends PaymentState{}
class paymentOrderIdError extends PaymentState{
  String error;
  paymentOrderIdError(this.error);
}

class paymentTokenSuccess extends PaymentState{}
class paymentTokenError extends PaymentState{
  String error;
  paymentTokenError(this.error);
}

class paymentTokenKioskSuccess extends PaymentState{}
class paymentTokenKioskError extends PaymentState{
  String error;
  paymentTokenKioskError(this.error);
}

class paymentRefCodeSuccess extends PaymentState{}
class paymentRefCodeError extends PaymentState{
  String error;
  paymentRefCodeError(this.error);
}