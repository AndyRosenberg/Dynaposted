<template>
  <div class="hero is-fullheight is-dark">
      <section>
        <div class="hero-body">
          <div id="new-complaint-form" class="container">
            <div id="stand-up" class="columns is-centered is-6">
              <h1 class="has-text-white title is-1">Create an account</h1>
            </div>
            <div class="columns is-centered">
              <div class="column is-5-tablet is-4-desktop is-3-widescreen">
                <form action="/users" method="POST">
                  <input type="hidden" name="authenticity_token" v-model="csrf" />
                  <div class="field">
                    <label for="email" class="label has-text-white">Email</label>
                    <div class="control has-icons-left">
                      <input type="email" name="email" placeholder="Enter your email." class="input" required>
                    </div>
                  </div>

                  <div class="field">
                    <label for="name" class="label has-text-white">Username</label>
                    <div class="control has-icons-left">
                      <input type="text" name="name" placeholder="Enter your username." class="input" required>
                    </div>
                  </div>

                  <div class="field">
                    <label for="password" class="label has-text-white">Password</label>
                    <div class="control has-icons-left">
                      <input type="password" name="password" placeholder="Enter your password." class="input" required>
                    </div>
                  </div>
                  
      
                  <div class="field">
                    <button class="button is-success">
                      Get Started!
                    </button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
</template>

<script>
  export default {
    data() {
      return {
        csrf: document.querySelector('meta[name=_csrf]').content,
      };
    }
  }
</script>