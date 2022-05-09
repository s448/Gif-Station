class CategoryModel {
  List<Data>? data;
  Pagination? pagination;
  Meta? meta;

  CategoryModel({
    this.data,
    this.pagination,
    this.meta,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    data = (json['data'] as List?)
        ?.map((dynamic e) => Data.fromJson(e as Map<String, dynamic>))
        .toList();
    pagination = (json['pagination'] as Map<String, dynamic>?) != null
        ? Pagination.fromJson(json['pagination'] as Map<String, dynamic>)
        : null;
    meta = (json['meta'] as Map<String, dynamic>?) != null
        ? Meta.fromJson(json['meta'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['data'] = data?.map((e) => e.toJson()).toList();
    json['pagination'] = pagination?.toJson();
    json['meta'] = meta?.toJson();
    return json;
  }
}

class Data {
  String? name;
  String? nameEncoded;
  List<Subcategories>? subcategories;
  Gif? gif;

  Data({
    this.name,
    this.nameEncoded,
    this.subcategories,
    this.gif,
  });

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    nameEncoded = json['name_encoded'] as String?;
    subcategories = (json['subcategories'] as List?)
        ?.map((dynamic e) => Subcategories.fromJson(e as Map<String, dynamic>))
        .toList();
    gif = (json['gif'] as Map<String, dynamic>?) != null
        ? Gif.fromJson(json['gif'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['name_encoded'] = nameEncoded;
    json['subcategories'] = subcategories?.map((e) => e.toJson()).toList();
    json['gif'] = gif?.toJson();
    return json;
  }
}

class Subcategories {
  String? name;
  String? nameEncoded;

  Subcategories({
    this.name,
    this.nameEncoded,
  });

  Subcategories.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    nameEncoded = json['name_encoded'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['name_encoded'] = nameEncoded;
    return json;
  }
}

class Gif {
  String? type;
  String? id;
  String? url;
  String? slug;
  String? bitlyGifUrl;
  String? bitlyUrl;
  String? embedUrl;
  String? username;
  String? source;
  String? title;
  String? rating;
  String? contentUrl;
  String? sourceTld;
  String? sourcePostUrl;
  int? isSticker;
  String? importDatetime;
  String? trendingDatetime;
  String? createDatetime;
  String? updateDatetime;
  Images? images;

  Gif({
    this.type,
    this.id,
    this.url,
    this.slug,
    this.bitlyGifUrl,
    this.bitlyUrl,
    this.embedUrl,
    this.username,
    this.source,
    this.title,
    this.rating,
    this.contentUrl,
    this.sourceTld,
    this.sourcePostUrl,
    this.isSticker,
    this.importDatetime,
    this.trendingDatetime,
    this.createDatetime,
    this.updateDatetime,
    this.images,
  });

  Gif.fromJson(Map<String, dynamic> json) {
    type = json['type'] as String?;
    id = json['id'] as String?;
    url = json['url'] as String?;
    slug = json['slug'] as String?;
    bitlyGifUrl = json['bitly_gif_url'] as String?;
    bitlyUrl = json['bitly_url'] as String?;
    embedUrl = json['embed_url'] as String?;
    username = json['username'] as String?;
    source = json['source'] as String?;
    title = json['title'] as String?;
    rating = json['rating'] as String?;
    contentUrl = json['content_url'] as String?;
    sourceTld = json['source_tld'] as String?;
    sourcePostUrl = json['source_post_url'] as String?;
    isSticker = json['is_sticker'] as int?;
    importDatetime = json['import_datetime'] as String?;
    trendingDatetime = json['trending_datetime'] as String?;
    createDatetime = json['create_datetime'] as String?;
    updateDatetime = json['update_datetime'] as String?;
    images = (json['images'] as Map<String, dynamic>?) != null
        ? Images.fromJson(json['images'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['type'] = type;
    json['id'] = id;
    json['url'] = url;
    json['slug'] = slug;
    json['bitly_gif_url'] = bitlyGifUrl;
    json['bitly_url'] = bitlyUrl;
    json['embed_url'] = embedUrl;
    json['username'] = username;
    json['source'] = source;
    json['title'] = title;
    json['rating'] = rating;
    json['content_url'] = contentUrl;
    json['source_tld'] = sourceTld;
    json['source_post_url'] = sourcePostUrl;
    json['is_sticker'] = isSticker;
    json['import_datetime'] = importDatetime;
    json['trending_datetime'] = trendingDatetime;
    json['create_datetime'] = createDatetime;
    json['update_datetime'] = updateDatetime;
    json['images'] = images?.toJson();
    return json;
  }
}

class Images {
  Downsized? wwStill;
  FixedWidthStill? fixedWidthStill;
  FixedHeightDownsampled? fixedHeightDownsampled;
  PreviewGif? previewGif;
  Preview? preview;
  FixedHeightSmall? fixedHeightSmall;
  Downsized? downsized;
  FixedWidthDownsampled? fixedWidthDownsampled;
  FixedWidth? fixedWidth;
  DownsizedStill? downsizedStill;
  DownsizedMedium? downsizedMedium;
  OriginalMp4? originalMp4;
  DownsizedLarge? downsizedLarge;
  PreviewWebp? previewWebp;
  Original? original;
  OriginalStill? originalStill;
  FixedHeightSmallStill? fixedHeightSmallStill;
  FixedWidthSmall? fixedWidthSmall;
  Looping? looping;
  DownsizedSmall? downsizedSmall;
  FixedWidthSmallStill? fixedWidthSmallStill;
  FixedHeightStill? fixedHeightStill;
  FixedHeight? fixedHeight;

  Images({
    this.wwStill,
    this.fixedWidthStill,
    this.fixedHeightDownsampled,
    this.previewGif,
    this.preview,
    this.fixedHeightSmall,
    this.downsized,
    this.fixedWidthDownsampled,
    this.fixedWidth,
    this.downsizedStill,
    this.downsizedMedium,
    this.originalMp4,
    this.downsizedLarge,
    this.previewWebp,
    this.original,
    this.originalStill,
    this.fixedHeightSmallStill,
    this.fixedWidthSmall,
    this.looping,
    this.downsizedSmall,
    this.fixedWidthSmallStill,
    this.fixedHeightStill,
    this.fixedHeight,
  });

  Images.fromJson(Map<String, dynamic> json) {
    wwStill = (json['480w_still'] as Map<String, dynamic>?) != null
        ? Downsized.fromJson(json['480w_still'] as Map<String, dynamic>)
        : null;
    fixedWidthStill =
        (json['fixed_width_still'] as Map<String, dynamic>?) != null
            ? FixedWidthStill.fromJson(
                json['fixed_width_still'] as Map<String, dynamic>)
            : null;
    fixedHeightDownsampled =
        (json['fixed_height_downsampled'] as Map<String, dynamic>?) != null
            ? FixedHeightDownsampled.fromJson(
                json['fixed_height_downsampled'] as Map<String, dynamic>)
            : null;
    previewGif = (json['preview_gif'] as Map<String, dynamic>?) != null
        ? PreviewGif.fromJson(json['preview_gif'] as Map<String, dynamic>)
        : null;
    preview = (json['preview'] as Map<String, dynamic>?) != null
        ? Preview.fromJson(json['preview'] as Map<String, dynamic>)
        : null;
    fixedHeightSmall =
        (json['fixed_height_small'] as Map<String, dynamic>?) != null
            ? FixedHeightSmall.fromJson(
                json['fixed_height_small'] as Map<String, dynamic>)
            : null;
    downsized = (json['downsized'] as Map<String, dynamic>?) != null
        ? Downsized.fromJson(json['downsized'] as Map<String, dynamic>)
        : null;
    fixedWidthDownsampled =
        (json['fixed_width_downsampled'] as Map<String, dynamic>?) != null
            ? FixedWidthDownsampled.fromJson(
                json['fixed_width_downsampled'] as Map<String, dynamic>)
            : null;
    fixedWidth = (json['fixed_width'] as Map<String, dynamic>?) != null
        ? FixedWidth.fromJson(json['fixed_width'] as Map<String, dynamic>)
        : null;
    downsizedStill = (json['downsized_still'] as Map<String, dynamic>?) != null
        ? DownsizedStill.fromJson(
            json['downsized_still'] as Map<String, dynamic>)
        : null;
    downsizedMedium =
        (json['downsized_medium'] as Map<String, dynamic>?) != null
            ? DownsizedMedium.fromJson(
                json['downsized_medium'] as Map<String, dynamic>)
            : null;
    originalMp4 = (json['original_mp4'] as Map<String, dynamic>?) != null
        ? OriginalMp4.fromJson(json['original_mp4'] as Map<String, dynamic>)
        : null;
    downsizedLarge = (json['downsized_large'] as Map<String, dynamic>?) != null
        ? DownsizedLarge.fromJson(
            json['downsized_large'] as Map<String, dynamic>)
        : null;
    previewWebp = (json['preview_webp'] as Map<String, dynamic>?) != null
        ? PreviewWebp.fromJson(json['preview_webp'] as Map<String, dynamic>)
        : null;
    original = (json['original'] as Map<String, dynamic>?) != null
        ? Original.fromJson(json['original'] as Map<String, dynamic>)
        : null;
    originalStill = (json['original_still'] as Map<String, dynamic>?) != null
        ? OriginalStill.fromJson(json['original_still'] as Map<String, dynamic>)
        : null;
    fixedHeightSmallStill =
        (json['fixed_height_small_still'] as Map<String, dynamic>?) != null
            ? FixedHeightSmallStill.fromJson(
                json['fixed_height_small_still'] as Map<String, dynamic>)
            : null;
    fixedWidthSmall =
        (json['fixed_width_small'] as Map<String, dynamic>?) != null
            ? FixedWidthSmall.fromJson(
                json['fixed_width_small'] as Map<String, dynamic>)
            : null;
    looping = (json['looping'] as Map<String, dynamic>?) != null
        ? Looping.fromJson(json['looping'] as Map<String, dynamic>)
        : null;
    downsizedSmall = (json['downsized_small'] as Map<String, dynamic>?) != null
        ? DownsizedSmall.fromJson(
            json['downsized_small'] as Map<String, dynamic>)
        : null;
    fixedWidthSmallStill =
        (json['fixed_width_small_still'] as Map<String, dynamic>?) != null
            ? FixedWidthSmallStill.fromJson(
                json['fixed_width_small_still'] as Map<String, dynamic>)
            : null;
    fixedHeightStill =
        (json['fixed_height_still'] as Map<String, dynamic>?) != null
            ? FixedHeightStill.fromJson(
                json['fixed_height_still'] as Map<String, dynamic>)
            : null;
    fixedHeight = (json['fixed_height'] as Map<String, dynamic>?) != null
        ? FixedHeight.fromJson(json['fixed_height'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['480w_still'] = wwStill?.toJson();
    json['fixed_width_still'] = fixedWidthStill?.toJson();
    json['fixed_height_downsampled'] = fixedHeightDownsampled?.toJson();
    json['preview_gif'] = previewGif?.toJson();
    json['preview'] = preview?.toJson();
    json['fixed_height_small'] = fixedHeightSmall?.toJson();
    json['downsized'] = downsized?.toJson();
    json['fixed_width_downsampled'] = fixedWidthDownsampled?.toJson();
    json['fixed_width'] = fixedWidth?.toJson();
    json['downsized_still'] = downsizedStill?.toJson();
    json['downsized_medium'] = downsizedMedium?.toJson();
    json['original_mp4'] = originalMp4?.toJson();
    json['downsized_large'] = downsizedLarge?.toJson();
    json['preview_webp'] = previewWebp?.toJson();
    json['original'] = original?.toJson();
    json['original_still'] = originalStill?.toJson();
    json['fixed_height_small_still'] = fixedHeightSmallStill?.toJson();
    json['fixed_width_small'] = fixedWidthSmall?.toJson();
    json['looping'] = looping?.toJson();
    json['downsized_small'] = downsizedSmall?.toJson();
    json['fixed_width_small_still'] = fixedWidthSmallStill?.toJson();
    json['fixed_height_still'] = fixedHeightStill?.toJson();
    json['fixed_height'] = fixedHeight?.toJson();
    return json;
  }
}

class wwStill {
  String? height;
  String? size;
  String? url;
  String? width;

  wwStill({
    this.height,
    this.size,
    this.url,
    this.width,
  });

  wwStill.fromJson(Map<String, dynamic> json) {
    height = json['height'] as String?;
    size = json['size'] as String?;
    url = json['url'] as String?;
    width = json['width'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['height'] = height;
    json['size'] = size;
    json['url'] = url;
    json['width'] = width;
    return json;
  }
}

class FixedWidthStill {
  String? height;
  String? size;
  String? url;
  String? width;

  FixedWidthStill({
    this.height,
    this.size,
    this.url,
    this.width,
  });

  FixedWidthStill.fromJson(Map<String, dynamic> json) {
    height = json['height'] as String?;
    size = json['size'] as String?;
    url = json['url'] as String?;
    width = json['width'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['height'] = height;
    json['size'] = size;
    json['url'] = url;
    json['width'] = width;
    return json;
  }
}

class FixedHeightDownsampled {
  String? height;
  String? size;
  String? url;
  String? webp;
  String? webpSize;
  String? width;

  FixedHeightDownsampled({
    this.height,
    this.size,
    this.url,
    this.webp,
    this.webpSize,
    this.width,
  });

  FixedHeightDownsampled.fromJson(Map<String, dynamic> json) {
    height = json['height'] as String?;
    size = json['size'] as String?;
    url = json['url'] as String?;
    webp = json['webp'] as String?;
    webpSize = json['webp_size'] as String?;
    width = json['width'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['height'] = height;
    json['size'] = size;
    json['url'] = url;
    json['webp'] = webp;
    json['webp_size'] = webpSize;
    json['width'] = width;
    return json;
  }
}

class PreviewGif {
  String? height;
  String? size;
  String? url;
  String? width;

  PreviewGif({
    this.height,
    this.size,
    this.url,
    this.width,
  });

  PreviewGif.fromJson(Map<String, dynamic> json) {
    height = json['height'] as String?;
    size = json['size'] as String?;
    url = json['url'] as String?;
    width = json['width'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['height'] = height;
    json['size'] = size;
    json['url'] = url;
    json['width'] = width;
    return json;
  }
}

class Preview {
  String? height;
  String? mp4;
  String? mp4Size;
  String? width;

  Preview({
    this.height,
    this.mp4,
    this.mp4Size,
    this.width,
  });

  Preview.fromJson(Map<String, dynamic> json) {
    height = json['height'] as String?;
    mp4 = json['mp4'] as String?;
    mp4Size = json['mp4_size'] as String?;
    width = json['width'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['height'] = height;
    json['mp4'] = mp4;
    json['mp4_size'] = mp4Size;
    json['width'] = width;
    return json;
  }
}

class FixedHeightSmall {
  String? height;
  String? mp4;
  String? mp4Size;
  String? size;
  String? url;
  String? webp;
  String? webpSize;
  String? width;

  FixedHeightSmall({
    this.height,
    this.mp4,
    this.mp4Size,
    this.size,
    this.url,
    this.webp,
    this.webpSize,
    this.width,
  });

  FixedHeightSmall.fromJson(Map<String, dynamic> json) {
    height = json['height'] as String?;
    mp4 = json['mp4'] as String?;
    mp4Size = json['mp4_size'] as String?;
    size = json['size'] as String?;
    url = json['url'] as String?;
    webp = json['webp'] as String?;
    webpSize = json['webp_size'] as String?;
    width = json['width'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['height'] = height;
    json['mp4'] = mp4;
    json['mp4_size'] = mp4Size;
    json['size'] = size;
    json['url'] = url;
    json['webp'] = webp;
    json['webp_size'] = webpSize;
    json['width'] = width;
    return json;
  }
}

class Downsized {
  String? height;
  String? size;
  String? url;
  String? width;

  Downsized({
    this.height,
    this.size,
    this.url,
    this.width,
  });

  Downsized.fromJson(Map<String, dynamic> json) {
    height = json['height'] as String?;
    size = json['size'] as String?;
    url = json['url'] as String?;
    width = json['width'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['height'] = height;
    json['size'] = size;
    json['url'] = url;
    json['width'] = width;
    return json;
  }
}

class FixedWidthDownsampled {
  String? height;
  String? size;
  String? url;
  String? webp;
  String? webpSize;
  String? width;

  FixedWidthDownsampled({
    this.height,
    this.size,
    this.url,
    this.webp,
    this.webpSize,
    this.width,
  });

  FixedWidthDownsampled.fromJson(Map<String, dynamic> json) {
    height = json['height'] as String?;
    size = json['size'] as String?;
    url = json['url'] as String?;
    webp = json['webp'] as String?;
    webpSize = json['webp_size'] as String?;
    width = json['width'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['height'] = height;
    json['size'] = size;
    json['url'] = url;
    json['webp'] = webp;
    json['webp_size'] = webpSize;
    json['width'] = width;
    return json;
  }
}

class FixedWidth {
  String? height;
  String? mp4;
  String? mp4Size;
  String? size;
  String? url;
  String? webp;
  String? webpSize;
  String? width;

  FixedWidth({
    this.height,
    this.mp4,
    this.mp4Size,
    this.size,
    this.url,
    this.webp,
    this.webpSize,
    this.width,
  });

  FixedWidth.fromJson(Map<String, dynamic> json) {
    height = json['height'] as String?;
    mp4 = json['mp4'] as String?;
    mp4Size = json['mp4_size'] as String?;
    size = json['size'] as String?;
    url = json['url'] as String?;
    webp = json['webp'] as String?;
    webpSize = json['webp_size'] as String?;
    width = json['width'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['height'] = height;
    json['mp4'] = mp4;
    json['mp4_size'] = mp4Size;
    json['size'] = size;
    json['url'] = url;
    json['webp'] = webp;
    json['webp_size'] = webpSize;
    json['width'] = width;
    return json;
  }
}

class DownsizedStill {
  String? height;
  String? size;
  String? url;
  String? width;

  DownsizedStill({
    this.height,
    this.size,
    this.url,
    this.width,
  });

  DownsizedStill.fromJson(Map<String, dynamic> json) {
    height = json['height'] as String?;
    size = json['size'] as String?;
    url = json['url'] as String?;
    width = json['width'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['height'] = height;
    json['size'] = size;
    json['url'] = url;
    json['width'] = width;
    return json;
  }
}

class DownsizedMedium {
  String? height;
  String? size;
  String? url;
  String? width;

  DownsizedMedium({
    this.height,
    this.size,
    this.url,
    this.width,
  });

  DownsizedMedium.fromJson(Map<String, dynamic> json) {
    height = json['height'] as String?;
    size = json['size'] as String?;
    url = json['url'] as String?;
    width = json['width'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['height'] = height;
    json['size'] = size;
    json['url'] = url;
    json['width'] = width;
    return json;
  }
}

class OriginalMp4 {
  String? height;
  String? mp4;
  String? mp4Size;
  String? width;

  OriginalMp4({
    this.height,
    this.mp4,
    this.mp4Size,
    this.width,
  });

  OriginalMp4.fromJson(Map<String, dynamic> json) {
    height = json['height'] as String?;
    mp4 = json['mp4'] as String?;
    mp4Size = json['mp4_size'] as String?;
    width = json['width'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['height'] = height;
    json['mp4'] = mp4;
    json['mp4_size'] = mp4Size;
    json['width'] = width;
    return json;
  }
}

class DownsizedLarge {
  String? height;
  String? size;
  String? url;
  String? width;

  DownsizedLarge({
    this.height,
    this.size,
    this.url,
    this.width,
  });

  DownsizedLarge.fromJson(Map<String, dynamic> json) {
    height = json['height'] as String?;
    size = json['size'] as String?;
    url = json['url'] as String?;
    width = json['width'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['height'] = height;
    json['size'] = size;
    json['url'] = url;
    json['width'] = width;
    return json;
  }
}

class PreviewWebp {
  String? height;
  String? size;
  String? url;
  String? width;

  PreviewWebp({
    this.height,
    this.size,
    this.url,
    this.width,
  });

  PreviewWebp.fromJson(Map<String, dynamic> json) {
    height = json['height'] as String?;
    size = json['size'] as String?;
    url = json['url'] as String?;
    width = json['width'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['height'] = height;
    json['size'] = size;
    json['url'] = url;
    json['width'] = width;
    return json;
  }
}

class Original {
  String? frames;
  String? hash;
  String? height;
  String? mp4;
  String? mp4Size;
  String? size;
  String? url;
  String? webp;
  String? webpSize;
  String? width;

  Original({
    this.frames,
    this.hash,
    this.height,
    this.mp4,
    this.mp4Size,
    this.size,
    this.url,
    this.webp,
    this.webpSize,
    this.width,
  });

  Original.fromJson(Map<String, dynamic> json) {
    frames = json['frames'] as String?;
    hash = json['hash'] as String?;
    height = json['height'] as String?;
    mp4 = json['mp4'] as String?;
    mp4Size = json['mp4_size'] as String?;
    size = json['size'] as String?;
    url = json['url'] as String?;
    webp = json['webp'] as String?;
    webpSize = json['webp_size'] as String?;
    width = json['width'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['frames'] = frames;
    json['hash'] = hash;
    json['height'] = height;
    json['mp4'] = mp4;
    json['mp4_size'] = mp4Size;
    json['size'] = size;
    json['url'] = url;
    json['webp'] = webp;
    json['webp_size'] = webpSize;
    json['width'] = width;
    return json;
  }
}

class OriginalStill {
  String? height;
  String? size;
  String? url;
  String? width;

  OriginalStill({
    this.height,
    this.size,
    this.url,
    this.width,
  });

  OriginalStill.fromJson(Map<String, dynamic> json) {
    height = json['height'] as String?;
    size = json['size'] as String?;
    url = json['url'] as String?;
    width = json['width'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['height'] = height;
    json['size'] = size;
    json['url'] = url;
    json['width'] = width;
    return json;
  }
}

class FixedHeightSmallStill {
  String? height;
  String? size;
  String? url;
  String? width;

  FixedHeightSmallStill({
    this.height,
    this.size,
    this.url,
    this.width,
  });

  FixedHeightSmallStill.fromJson(Map<String, dynamic> json) {
    height = json['height'] as String?;
    size = json['size'] as String?;
    url = json['url'] as String?;
    width = json['width'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['height'] = height;
    json['size'] = size;
    json['url'] = url;
    json['width'] = width;
    return json;
  }
}

class FixedWidthSmall {
  String? height;
  String? mp4;
  String? mp4Size;
  String? size;
  String? url;
  String? webp;
  String? webpSize;
  String? width;

  FixedWidthSmall({
    this.height,
    this.mp4,
    this.mp4Size,
    this.size,
    this.url,
    this.webp,
    this.webpSize,
    this.width,
  });

  FixedWidthSmall.fromJson(Map<String, dynamic> json) {
    height = json['height'] as String?;
    mp4 = json['mp4'] as String?;
    mp4Size = json['mp4_size'] as String?;
    size = json['size'] as String?;
    url = json['url'] as String?;
    webp = json['webp'] as String?;
    webpSize = json['webp_size'] as String?;
    width = json['width'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['height'] = height;
    json['mp4'] = mp4;
    json['mp4_size'] = mp4Size;
    json['size'] = size;
    json['url'] = url;
    json['webp'] = webp;
    json['webp_size'] = webpSize;
    json['width'] = width;
    return json;
  }
}

class Looping {
  String? mp4;
  String? mp4Size;

  Looping({
    this.mp4,
    this.mp4Size,
  });

  Looping.fromJson(Map<String, dynamic> json) {
    mp4 = json['mp4'] as String?;
    mp4Size = json['mp4_size'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['mp4'] = mp4;
    json['mp4_size'] = mp4Size;
    return json;
  }
}

class DownsizedSmall {
  String? height;
  String? mp4;
  String? mp4Size;
  String? width;

  DownsizedSmall({
    this.height,
    this.mp4,
    this.mp4Size,
    this.width,
  });

  DownsizedSmall.fromJson(Map<String, dynamic> json) {
    height = json['height'] as String?;
    mp4 = json['mp4'] as String?;
    mp4Size = json['mp4_size'] as String?;
    width = json['width'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['height'] = height;
    json['mp4'] = mp4;
    json['mp4_size'] = mp4Size;
    json['width'] = width;
    return json;
  }
}

class FixedWidthSmallStill {
  String? height;
  String? size;
  String? url;
  String? width;

  FixedWidthSmallStill({
    this.height,
    this.size,
    this.url,
    this.width,
  });

  FixedWidthSmallStill.fromJson(Map<String, dynamic> json) {
    height = json['height'] as String?;
    size = json['size'] as String?;
    url = json['url'] as String?;
    width = json['width'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['height'] = height;
    json['size'] = size;
    json['url'] = url;
    json['width'] = width;
    return json;
  }
}

class FixedHeightStill {
  String? height;
  String? size;
  String? url;
  String? width;

  FixedHeightStill({
    this.height,
    this.size,
    this.url,
    this.width,
  });

  FixedHeightStill.fromJson(Map<String, dynamic> json) {
    height = json['height'] as String?;
    size = json['size'] as String?;
    url = json['url'] as String?;
    width = json['width'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['height'] = height;
    json['size'] = size;
    json['url'] = url;
    json['width'] = width;
    return json;
  }
}

class FixedHeight {
  String? height;
  String? mp4;
  String? mp4Size;
  String? size;
  String? url;
  String? webp;
  String? webpSize;
  String? width;

  FixedHeight({
    this.height,
    this.mp4,
    this.mp4Size,
    this.size,
    this.url,
    this.webp,
    this.webpSize,
    this.width,
  });

  FixedHeight.fromJson(Map<String, dynamic> json) {
    height = json['height'] as String?;
    mp4 = json['mp4'] as String?;
    mp4Size = json['mp4_size'] as String?;
    size = json['size'] as String?;
    url = json['url'] as String?;
    webp = json['webp'] as String?;
    webpSize = json['webp_size'] as String?;
    width = json['width'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['height'] = height;
    json['mp4'] = mp4;
    json['mp4_size'] = mp4Size;
    json['size'] = size;
    json['url'] = url;
    json['webp'] = webp;
    json['webp_size'] = webpSize;
    json['width'] = width;
    return json;
  }
}

class Pagination {
  int? totalCount;
  int? count;

  Pagination({
    this.totalCount,
    this.count,
  });

  Pagination.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'] as int?;
    count = json['count'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['total_count'] = totalCount;
    json['count'] = count;
    return json;
  }
}

class Meta {
  String? msg;
  int? status;
  String? responseId;

  Meta({
    this.msg,
    this.status,
    this.responseId,
  });

  Meta.fromJson(Map<String, dynamic> json) {
    msg = json['msg'] as String?;
    status = json['status'] as int?;
    responseId = json['response_id'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['msg'] = msg;
    json['status'] = status;
    json['response_id'] = responseId;
    return json;
  }
}
