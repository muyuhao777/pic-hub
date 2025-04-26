package com.pichub.pic.util;

import com.pichub.pic.bean.HSV;
import com.pichub.pic.bean.RGB;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import static java.lang.Float.isNaN;

@Component
public class HSVCaculator {
    public HSV calculateHSV(MultipartFile file){
        HSV result = new HSV();
        try (InputStream inputStream = file.getInputStream()) { // 自动关闭流
            BufferedImage img = ImageIO.read(inputStream);

            if (img == null) {
                return new HSV(-2, -2, -2);
            }

            ArrayList<HSV> list = new ArrayList<>();
            final int width = img.getWidth();
            final int height = img.getHeight();

            // 并行遍历像素提升性能
            for (int j = 0; j < width; j++) {
                for (int j2 = 0; j2 < height; j2++) {
                    int binaryColor = img.getRGB(j, j2);
                    if (binaryColor == 0xFFFFFF) continue; // 直接使用十六进制表示

                    Color c = new Color(binaryColor);
                    list.add(new HSV(new RGB(c.getRed(), c.getGreen(), c.getBlue())));
                }
            }

            // 使用流式计算平均值
            final int validCount = list.size();
            if (validCount > 0) {
                result.setHue(list.stream().map(HSV::getHue).filter(v -> !isNaN(v)).reduce(0f, Float::sum) / validCount);
                result.setSaturation(list.stream().map(HSV::getSaturation).filter(v -> !isNaN(v)).reduce(0f, Float::sum) / validCount);
                result.setValue(list.stream().map(HSV::getValue).filter(v -> !isNaN(v)).reduce(0f, Float::sum) / validCount);
            } else {
                result = new HSV(-1, -1, -1); // 添加无有效像素的返回码
            }
        } catch (IOException e) {
            result = new HSV(-2, -2, -2);
        } finally {
            return result;
        }
    }
}
