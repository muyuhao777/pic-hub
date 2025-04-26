package com.pichub.pic.bean;

public class HSV {
    public float Hue;
    public float Saturation;
    public float Value;

    public HSV(float hue, float saturation, float value) {
        Hue = hue;
        Saturation = saturation;
        Value = value;
    }

    private float zuida(float a, float b, float c){
        if(a>b){
            if(a>c){
                return a;
            }else{
                return c;
            }
        }else{
            if(b>c){
                return b;
            }else{
                return c;
            }
        }
    }
    private float zuixiao(float a,float b,float c){
        if(a<b){
            if(a<c){
                return a;
            }else{
                return c;
            }
        }else{
            if(b<c){
                return b;
            }else{
                return c;
            }
        }
    }

    public HSV() {
    }

    public HSV(RGB rgb) {
        float max=zuida(rgb.getBlue(),rgb.getGreen(),rgb.getRed());
        float min=zuixiao(rgb.getBlue(),rgb.getGreen(),rgb.getRed());
        Value=max;
        if(max==0){
            Saturation=0;
        }else{
            Saturation=(max-min)/max;
        }
        if(max!=min){
            if(rgb.getRed()==max){
                Hue=(rgb.getGreen()- rgb.getBlue())/(max-min)*60;
            }
            if(rgb.getGreen()==max){
                Hue=120+(rgb.getBlue()- rgb.getRed())/(max-min)*60;
            }
            if(rgb.getBlue()==max){
                Hue=240+(rgb.getRed()- rgb.getGreen())/(max-min)*60;
            }
        }else{
            Hue=0;
        }
        if(Hue<0){
            Hue=Hue+360;
        }
        Hue=Hue/2;
        Saturation=Saturation*255;
    }

    public void setHue(float hue) {
        Hue = hue;
    }

    public void setSaturation(float saturation) {
        Saturation = saturation;
    }

    public void setValue(float value) {
        Value = value;
    }

    public float getHue() {
        return Hue;
    }

    public float getSaturation() {
        return Saturation;
    }

    public float getValue() {
        return Value;
    }
}