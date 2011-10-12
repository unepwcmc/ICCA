I18n.backend.class.send(:include, I18n::Backend::Fallbacks)
I18n.fallbacks.map('es' => 'en')
I18n.fallbacks.map('fr' => 'en')

