class FeedbackForm {
  String _feedback;

  FeedbackForm(this._feedback);

  String toParams() => "?feedback=$_feedback";
}
