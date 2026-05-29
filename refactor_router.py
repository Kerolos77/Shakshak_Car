import re

file_path = 'lib/core/router/app_router.dart'
with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# Replace arrow-function pageBuilders
# Example:
# pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
#   context: context,
#   state: state,
#   child: const SplashView(),
# ),
content = re.sub(
    r'pageBuilder:\s*\(([^)]+)\)\s*=>\s*buildPageWithDefaultTransition<[^>]+>\(\s*context:\s*context,\s*state:\s*state,\s*child:\s*(.*?)(?:,\s*)?\s*\)',
    r'builder: (\1) => \2',
    content,
    flags=re.DOTALL
)

# For block pageBuilders, we first replace the return statement:
# return buildPageWithDefaultTransition<void>(
#   context: context,
#   state: state,
#   child: Widget(),
# );
content = re.sub(
    r'return\s+buildPageWithDefaultTransition<[^>]+>\(\s*context:\s*context,\s*state:\s*state,\s*child:\s*(.*?)(?:,\s*)?\s*\);',
    r'return \1;',
    content,
    flags=re.DOTALL
)

# And then replace pageBuilder: (context, state) { with builder: (context, state) {
# Need to be careful. We can just replace all pageBuilder: with builder: since we converted ALL of them.
content = content.replace('pageBuilder:', 'builder:')

# Optionally, remove the unused buildPageWithDefaultTransition function at the bottom of the file
content = re.sub(r'CustomTransitionPage buildPageWithDefaultTransition<T>.*?(?:\n\n)', '\n\n', content, flags=re.DOTALL)
content = re.sub(r'CustomTransitionPage buildPageWithSlideTransition<T>.*?(?:\n\n)', '\n\n', content, flags=re.DOTALL)

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Router updated!")
