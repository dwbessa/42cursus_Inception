<?php
define('WP_USE_THEMES', false);
define('WP_DEFAULT_THEME', 'astra');
define('WPLANG', 'en_US');
require_once __DIR__ . '/wp-load.php';

error_reporting(0);
@ini_set('display_errors', 0);


update_option('blogdescription', 'My Personal Blog');
update_option('posts_per_page', 5);

echo "Theme setup completed successfully.\n";
