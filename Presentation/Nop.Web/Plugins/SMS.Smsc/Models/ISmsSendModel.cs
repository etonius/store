namespace Nop.Plugin.SMS.Smsc.Models
{
    public interface ISmsSendModel
    {
        string[] PhoneNumbers { get; set; }
        string From { get; set; }
        string Text { get; set; }

        int Concat { get; set; }
        int DelivAck { get; set; }
        int MsgCallback { get; set; }
        int DelivTime { get; set; }
        float MaxCredits { get; set; }
        int ReqFeat { get; set; }
        int Queue { get; set; }
        int Escalate { get; set; }
        int Mo { get; set; }
        string CliMsgId { get; set; }
        int Unicode { get; set; }
        string MsgType { get; set; }
        string Udh { get; set; }
        string Data { get; set; }
        int Validity { get; set; }
    }
}
