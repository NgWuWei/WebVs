using System;
using System.Collections.Generic;
using System.Web;

namespace Web.App_Code
{
    public class Answer
    {
        public Answer()
        {



        }

        private string _questionID;
        private string _correctAnswer;
        private string _userAnswer;
        private string _result;

        public string QuestionID
        {
            get { return _questionID; }
            set { _questionID = value; }
        }

        public string CorrectAnswer
        {
            get { return _correctAnswer; }
            set { _correctAnswer = value; }
        }

        public string UserAnswer
        {
            get { return _userAnswer; }
            set { _userAnswer = value; }
        }

        public ResultValue Result
        {
            get
            {
                if (_userAnswer == _correctAnswer)
                {
                    return ResultValue.Correct;
                }
                else
                {
                    return ResultValue.Incorrect;
                }
            }
        }

        public enum ResultValue { Correct, Incorrect }
    }

}