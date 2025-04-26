package com.pichub.pic.bean;

public class RGB {
    public float Red;
    public float Green;
    public float Blue;

    public RGB(float red, float green, float blue) {
        Red = red;
        Green = green;
        Blue = blue;
    }

    public void setRed(float red) {
        Red = red;
    }

    public void setGreen(float green) {
        Green = green;
    }

    public void setBlue(float blue) {
        Blue = blue;
    }

    public float getRed() {
        return Red;
    }

    public float getGreen() {
        return Green;
    }

    public float getBlue() {
        return Blue;
    }
}