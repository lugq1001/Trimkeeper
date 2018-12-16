// Generated by Apple Swift version 4.2.1 (swiftlang-1000.11.42 clang-1000.11.45.1)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus)
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR(_extensibility) __attribute__((enum_extensibility(_extensibility)))
# else
#  define SWIFT_ENUM_ATTR(_extensibility)
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name, _extensibility) enum _name : _type _name; enum SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) SWIFT_ENUM(_type, _name, _extensibility)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if __has_feature(modules)
@import Foundation;
@import ObjectiveC;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"

#if __has_attribute(external_source_symbol)
# pragma push_macro("any")
# undef any
# pragma clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in="Trimkeeper",generated_declaration))), apply_to=any(function,enum,objc_interface,objc_category,objc_protocol))
# pragma pop_macro("any")
#endif

@class TKError;

@interface NSError (SWIFT_EXTENSION(Trimkeeper))
@property (nonatomic, readonly, strong) TKError * _Nonnull toTrimkeeperError;
@end

enum PrinterModel : NSInteger;

/// 打印机
SWIFT_CLASS("_TtC10Trimkeeper7Printer")
@interface Printer : NSObject
- (nonnull instancetype)initWithHost:(NSString * _Nonnull)host port:(uint16_t)port mode:(enum PrinterModel)mode OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_DEPRECATED_MSG("-init is unavailable");
@end


@interface Printer (SWIFT_EXTENSION(Trimkeeper))
@property (nonatomic, readonly, copy) NSString * _Nonnull description;
@end

/// 打印机型号
/// <ul>
///   <li>
///     avery9419: 9419
///   </li>
/// </ul>
typedef SWIFT_ENUM(NSInteger, PrinterModel, closed) {
  PrinterModelAvery9419 = 0,
};

enum TKErrorType : NSInteger;

SWIFT_CLASS("_TtC10Trimkeeper7TKError")
@interface TKError : NSObject
@property (nonatomic, readonly) enum TKErrorType type;
@property (nonatomic, readonly, copy) NSString * _Nonnull message;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_DEPRECATED_MSG("-init is unavailable");
@end

typedef SWIFT_ENUM(NSInteger, TKErrorType, closed) {
  TKErrorTypeAuth = 0,
  TKErrorTypeUnknown = 1,
  TKErrorTypeUnregister = 2,
  TKErrorTypePrinterError = 3,
  TKErrorTypeTemplateNotFound = 4,
  TKErrorTypeAssetNotFound = 5,
};


SWIFT_CLASS("_TtC10Trimkeeper10TKTemplate")
@interface TKTemplate : NSObject
/// 名称
@property (nonatomic, readonly, copy) NSString * _Nonnull name;
/// 显示名称
@property (nonatomic, readonly, copy) NSString * _Nonnull displayName;
/// 预览地址 预览为html
@property (nonatomic, readonly, copy) NSString * _Nonnull previewUrl;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_DEPRECATED_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC10Trimkeeper16TKTemplateFormat")
@interface TKTemplateFormat : NSObject
- (nonnull instancetype)initWithTemplateName:(NSString * _Nonnull)templateName OBJC_DESIGNATED_INITIALIZER;
- (void)addWithEncodingVariable:(NSString * _Nonnull)variable forPlaceholder:(NSString * _Nonnull)placeholder;
- (void)addWithVariable:(NSString * _Nonnull)variable forPlaceholder:(NSString * _Nonnull)placeholder;
- (void)addWithQr:(NSString * _Nonnull)qr forPlaceholder:(NSString * _Nonnull)placeholder;
- (void)addWithBarCode:(NSString * _Nonnull)barCode forPlaceholder:(NSString * _Nonnull)placeholder;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_DEPRECATED_MSG("-init is unavailable");
@end



@protocol TrimkeeperDelegate;

SWIFT_CLASS("_TtC10Trimkeeper10Trimkeeper")
@interface Trimkeeper : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, strong) Trimkeeper * _Nonnull shared;)
+ (Trimkeeper * _Nonnull)shared SWIFT_WARN_UNUSED_RESULT;
@property (nonatomic, weak) id <TrimkeeperDelegate> _Nullable delegate;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


@interface Trimkeeper (SWIFT_EXTENSION(Trimkeeper))
/// SDK注册
/// \param appID 分配的AppID
///
/// \param appSecret 分配的密钥
///
/// \param completion callback
///
- (void)registerWithAppID:(NSString * _Nonnull)appID appSecret:(NSString * _Nonnull)appSecret completion:(void (^ _Nonnull)(TKError * _Nullable))completion;
/// 连接打印机
/// \param printer 打印机
///
///
/// throws:
/// TrimkeeperError
- (BOOL)connectPrinter:(Printer * _Nonnull)printer error:(NSError * _Nullable * _Nullable)error;
/// 断开打印机连接
- (void)disconnectPrinter;
- (BOOL)isPrinterConnected SWIFT_WARN_UNUSED_RESULT;
/// 更新模版及资源文件
/// 需网络
/// \param completion callback
///
- (void)updateAssetsWithCompletion:(void (^ _Nonnull)(TKError * _Nullable))completion;
/// 将模版及资源文件发送至打印机
/// 在调用updateAssets后，需确保连接打印机，并调用此方法初始化打印机资源
///
/// throws:
/// TrimkeeperError
- (void)sendAssetsToPrinterWithCompletion:(void (^ _Nonnull)(TKError * _Nullable))completion;
/// 模板列表
/// 在调用updateAssets后，可以调用此方法查看当前所有的模板信息，方便对接
///
/// returns:
/// [TKTemplate]
- (NSArray<TKTemplate *> * _Nonnull)listAllTemplates SWIFT_WARN_UNUSED_RESULT;
/// 打印模板
/// \param template 模板
///
///
/// throws:
/// TrimkeeperError
- (BOOL)printWithTemplate:(TKTemplateFormat * _Nonnull)template_ error:(NSError * _Nullable * _Nullable)error;
/// 批量打印模板
/// \param templates 模板
///
///
/// throws:
/// TrimkeeperError
- (BOOL)printWithTemplates:(NSArray<TKTemplateFormat *> * _Nonnull)templates error:(NSError * _Nullable * _Nullable)error;
@end


SWIFT_PROTOCOL("_TtP10Trimkeeper18TrimkeeperDelegate_")
@protocol TrimkeeperDelegate
- (void)trimkeeperWithDidConnectTo:(Printer * _Nonnull)printer;
- (void)trimkeeperWithDidDisconnectTo:(Printer * _Nonnull)printer withError:(TKError * _Nonnull)error;
@end

#if __has_attribute(external_source_symbol)
# pragma clang attribute pop
#endif
#pragma clang diagnostic pop
