function [ratio] = compressRatio(image)
info = imfinfo(image);
ratio = info.FileSize / (info.Width*info.Height*info.BitDepth);
