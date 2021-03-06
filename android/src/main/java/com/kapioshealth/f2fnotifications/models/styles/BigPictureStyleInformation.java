package com.kapioshealth.f2fnotifications.models.styles;

import com.kapioshealth.f2fnotifications.BitmapSource;

public class BigPictureStyleInformation extends DefaultStyleInformation {
    public String contentTitle;
    public Boolean htmlFormatContentTitle;
    public String summaryText;
    public Boolean htmlFormatSummaryText;
    public String largeIcon;
    public BitmapSource largeIconBitmapSource;
    public String bigPicture;
    public BitmapSource bigPictureBitmapSource;

    public BigPictureStyleInformation(Boolean htmlFormatTitle, Boolean htmlFormatBody, String contentTitle, Boolean htmlFormatContentTitle, String summaryText, Boolean htmlFormatSummaryText, String largeIcon, BitmapSource largeIconBitmapSource, String bigPicture, BitmapSource bigPictureBitmapSource) {
        super(htmlFormatTitle, htmlFormatBody);
        this.contentTitle = contentTitle;
        this.htmlFormatContentTitle = htmlFormatContentTitle;
        this.summaryText = summaryText;
        this.htmlFormatSummaryText = htmlFormatSummaryText;
        this.largeIcon = largeIcon;
        this.largeIconBitmapSource = largeIconBitmapSource;
        this.bigPicture = bigPicture;
        this.bigPictureBitmapSource = bigPictureBitmapSource;
    }
}
