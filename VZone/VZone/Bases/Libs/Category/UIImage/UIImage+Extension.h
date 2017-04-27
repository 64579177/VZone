

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
/**
 *  圆形剪裁图片
 *
 *  @param borderW   圆环宽度
 *  @param color     圆环颜色
 *  @param imageName 图片名称
 *
 *  @return 剪裁好的图片
 */
+ (UIImage *)imageWithBorderW:(CGFloat)borderW color:(UIColor *)color CircleImageName:(NSString *)imageName;

+ (UIImage *)resizableImageWithName:(NSString *)imageName;

/**
 *  争对ios7以上的系统适配新的图片资源
 *
 *  @param imageName 图片名称
 *
 *  @return 新的图片
 */
+ (UIImage *) imageWithName:(NSString *) imageName;


- (UIImage*) scaleImageWithSize:(CGSize)size;

+ (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize;

//按比例缩放,size 是你要把图显示到 多大区域 CGSizeMake(300, 140)
+(UIImage *) imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size;
@end
