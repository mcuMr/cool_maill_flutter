# cool_maill_flutter

复刻 Android 版商城项目，

## 详细说明

## 原项目作者信息
- 作者    ： JokerX  
- github ： https://github.com/Joker-x-dev/CoolMallKotlin
- 掘金    ： https://juejin.cn/post/7533134306342289471

## 项目结构
```
lib/
│
├── main.dart
├── app.dart
│
├── app/
│   ├── router/
│   │   ├── app_router.dart
│   │   ├── route_name.dart
│   │   └── route_guard.dart
│   │
│   ├── theme/
│   │   ├── app_theme.dart
│   │   ├── app_colors.dart
│   │   ├── app_text_style.dart
│   │   └── app_dimens.dart
│   │
│   ├── di/
│   │   ├── injector.dart
│   │   └── injector.config.dart
│   │
│   └── config/
│       ├── env.dart
│       ├── app_config.dart
│       └── flavors.dart
│
├── core/
│   │
│   ├── network/
│   │   ├── dio_client.dart
│   │   ├── api_constants.dart
│   │   ├── api_result.dart
│   │   ├── exception/
│   │   │   ├── api_exception.dart
│   │   │   └── network_exception.dart
│   │   │
│   │   └── interceptor/
│   │       ├── auth_interceptor.dart
│   │       ├── log_interceptor.dart
│   │       └── token_interceptor.dart
│   │
│   ├── storage/
│   │   ├── local_storage.dart
│   │   ├── secure_storage.dart
│   │   └── cache_manager.dart
│   │
│   ├── base/
│   │   ├── base_page.dart
│   │   ├── base_repository.dart
│   │   ├── base_state.dart
│   │   ├── base_notifier.dart
│   │   └── page_status.dart
│   │
│   ├── widgets/
│   │   ├── app_loading.dart
│   │   ├── app_empty.dart
│   │   ├── app_error.dart
│   │   ├── common_button.dart
│   │   └── common_dialog.dart
│   │
│   ├── utils/
│   │   ├── logger.dart
│   │   ├── toast_util.dart
│   │   ├── date_util.dart
│   │   ├── price_util.dart
│   │   └── validator.dart
│   │
│   ├── constants/
│   │   ├── app_constants.dart
│   │   ├── storage_keys.dart
│   │   └── event_constants.dart
│   │
│   └── extensions/
│       ├── context_ext.dart
│       ├── string_ext.dart
│       └── num_ext.dart
│
├── features/
│
│   ├── splash/
│   │
│   ├── auth/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── home/
│   │   ├── data/
│   │   │
│   │   ├── datasource/
│   │   │   ├── home_api.dart
│   │   │   └── home_local.dart
│   │   │
│   │   ├── models/
│   │   │   ├── banner_model.dart
│   │   │   ├── category_model.dart
│   │   │   └── home_product_model.dart
│   │   │
│   │   └── repository/
│   │       └── home_repository_impl.dart
│   │
│   │   ├── domain/
│   │   │
│   │   ├── entities/
│   │   │   ├── banner_entity.dart
│   │   │   ├── category_entity.dart
│   │   │   └── product_entity.dart
│   │   │
│   │   ├── repository/
│   │   │   └── home_repository.dart
│   │   │
│   │   └── usecases/
│   │       ├── get_banner_usecase.dart
│   │       ├── get_category_usecase.dart
│   │       └── get_home_product_usecase.dart
│   │
│   │   └── presentation/
│   │       ├── pages/
│   │       │   └── home_page.dart
│   │       │
│   │       ├── widgets/
│   │       │   ├── banner_widget.dart
│   │       │   ├── category_widget.dart
│   │       │   └── product_card.dart
│   │       │
│   │       ├── providers/
│   │       │   └── home_provider.dart
│   │       │
│   │       └── states/
│   │           └── home_state.dart
│
│   ├── category/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│
│   ├── search/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│
│   ├── product/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│
│   ├── cart/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│
│   ├── order/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│
│   ├── payment/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│
│   ├── coupon/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│
│   ├── address/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│
│   ├── profile/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│
│   └── setting/
│       ├── data/
│       ├── domain/
│       └── presentation/
│
├── generated/
│   ├── assets.gen.dart
│   └── l10n.dart
│
├── l10n/
│   ├── app_en.arb
│   ├── app_zh.arb
│   └── app_ja.arb
│
└── assets/
    ├── images/
    ├── icons/
    ├── animations/
    ├── fonts/
    └── json/
```