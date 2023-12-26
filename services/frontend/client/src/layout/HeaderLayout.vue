<template>
  <section>
    <header>
      Secret Message
    </header>

    <slot />

  </section>
</template>

<style>
header {
  height: 90px;
  font-size: 24pt;
  font-style: italic;
  font-family: "JetBrains Mono", sans-serif;
  display: flex;
  align-items: center;
  padding-left: 40px;
}

</style>
